import wollok.game.*
import pepita.tactics.game.juego.*


object selector {

	var property position = game.center()
	var property invisible = false

	method image() = if(invisible) "empty.png" else (if(juego.personajeActivo()) "selector-red.png" else "selector-yellow.png")
	
	method conUnidadSeleccionada(logica) {
		if(juego.unidades().containsKey(position)) {
			const unidad = juego.unidades().get(position)
			logica.apply(unidad)
		}
	}
	
	method unidadSeleccionada(oSiNo) = juego.unidades().getOrElse(position, oSiNo)
	
	method arriba() {
		position = position.up(1)
	}
	
	method abajo() {
		position = position.down(1)
	}
	
	method izquierda() {
		position = position.left(1)
	}
	
	method derecha() {
		position = position.right(1)
	}
}

