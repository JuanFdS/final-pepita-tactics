import wollok.game.*
import pepita.tactics.game.juego.*


object selector {

	var position = game.center()
	var property invisible = false
	var property displays = []
	
	method position() = position

	method image() = if(invisible) "empty.png" else (if(juego.personajeActivo()) "selector-red.png" else "selector-yellow.png")
	
	method conUnidadSeleccionada(logica) {
		if(juego.unidades().containsKey(position)) {
			const unidad = juego.unidades().get(position)
			logica.apply(unidad)
		}
	}
	
	method unidadSeleccionada(oSiNo) = juego.unidades().getOrElse(position, oSiNo)
	
	method subscribirse(display) {
		displays.add(display)
	}
	
	method desuscribirse(display) {
		displays.remove(display)
	}
	
	method mover(movimiento) {
		position = movimiento.apply(position)
		displays.forEach { display => display.selectorSeMovio() }
	}
	
	method arriba() {
		self.mover { pos => pos.up(1) }
	}
	
	method abajo() {
		self.mover { pos => pos.down(1) }
	}
	
	method izquierda() {
		self.mover { pos => pos.left(1) }
	}
	
	method derecha() {
		self.mover { pos => pos.right(1) }
	}
}

