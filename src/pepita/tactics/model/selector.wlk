import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.AnimatedSprite.*


object selector {

	var property position = game.center()

	method image() = if(juego.personajeActivo()) "selector-red.png" else "selector-yellow.png"
	
	method conUnidadSeleccionada(logica) {
		if(juego.unidades().containsKey(position)) {
			const unidad = juego.unidades().get(position)
			logica.apply(unidad)
		}
	}
	
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

