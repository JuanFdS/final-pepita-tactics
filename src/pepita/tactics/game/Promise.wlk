import wollok.game.*
import pepita.tactics.juego.*

object promise {
	method pendiente(handlers) = new Promise(result = new Pending(handlers = handlers))
	method resuelta(value) = new Promise(result = new Success(value = value))
	method resultaTrasEjecutar(bloque) = self.resuelta(bloque.apply())
	method esperarYDevolver(milisegundos, bloque) = self.pendiente({ onSuccess, onError => game.schedule(milisegundos, { onSuccess.apply(bloque.apply()) })})
	method esperarYHacer(milisegundos, bloque) = self.esperarYDevolver(milisegundos, { bloque.apply(); return unit })
}

class Promise {
	var property result
	
	method initialize() {
		result.start(self)
	}
	
	// when we want to produce effect
	method forEach(block) = self.map({ value =>
		block.apply(value)
		return unit
	})
	
	// when we want to change the value in the promise
	method map(block) = result.map(self, block)

	// when we want to chain another promise
	method then(block) = result.then(self, block)
	
	method onError(block) = result.onError(self, block)
}

class Pending {
	var andThen = { x => x }
	const handlers

	method start(promise) {
		handlers.apply({ value => self.resolvePromise(promise, value) },
	   				   { error => self.failPromise(promise, error) })
	}

	method resolvePromise(promise, value) {
		promise.result(new Success(value = value))
		andThen.apply(promise)
	}
	
	method failPromise(promise, error) {
		promise.result(new Failure(error = error))
		andThen.apply(promise)
	}
	
	method map(promise, block) {
		const actualAndThen = andThen
		andThen = { x => actualAndThen.apply(x).map(block) }
		return promise
	}

	method then(promise, block) {
		const actualAndThen = andThen
		andThen = { x => actualAndThen.apply(x).then(block) }
		return promise
	}
	
	method onError(promise, block) {
		const actualAndThen = andThen
		andThen = { x => actualAndThen.apply(x).onError(block) }
		return promise
	}
}

class Success {
	const value
	
	method start(promise) {}

	method then(promise, block) = block.apply(value)
	
	method onError(promise, block) = promise
	
	method map(promise, block) = new Promise(result = new Success(value = block.apply(value)))
}

class Failure {
	const error
	
	method start(promise) {}
	
	method then(promise, block) = promise
	
	method onError(promise, block) = block.apply(error)
	
	method map(promise, block) = promise
}

object unit {}
