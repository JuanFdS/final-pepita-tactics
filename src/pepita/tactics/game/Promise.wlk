class Promise {
	var property result = new Pending()

	method start(block) {
		result.start(self, block)
	}
	
	method map(block) = result.map(self, block)

	method then(block) = result.then(self, block)
	
	method onError(block) = result.onError(self, block)
}

class Pending {
	var andThen = { x => x }

	method start(promise, block) {
		block.apply({ value => self.resolvePromise(promise, value) },
					{ error => self.failPromise(promise, error) }
		)
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

	method start(promise, block) {}

	method then(promise, block) = block.apply(value)
	
	method onError(promise, block) = promise
	
	method map(promise, block) = new Promise(result = new Success(value = block.apply(value))) 
}

class Failure {
	const error
	
	method start(promise, block) {}
	
	method then(promise, block) = promise
	
	method onError(promise, block) = block.apply(error)
	
	method map(promise, block) = promise
}

