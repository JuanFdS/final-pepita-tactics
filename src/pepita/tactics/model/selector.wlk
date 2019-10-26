import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.modoLibre.*
import pepita.tactics.game.AnimatedSprite.*


object selector {
	
	const sprite = new AnimatedSprite(name = { "selector-yellow" }, quantityOfFrames = {2}, speedFactor = 0.3)

	var property image = "tileSeleccionada.png"
	var property position = game.center()

	method image() = sprite.image()
	
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

