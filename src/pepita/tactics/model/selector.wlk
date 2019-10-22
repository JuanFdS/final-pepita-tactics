import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.modoLibre.*
import pepita.tactics.game.AnimatedSprite.*


object selector {
	
	const sprite = new AnimatedSprite(name = { "tileSeleccionada-" }, quantityOfFrames = {7}, speedFactor = 0.3)

	var property image = "tileSeleccionada.png"
	var property position = game.center()

	method image() = sprite.image()
	
	method conUnidadSeleccionada(logica) {
		if(juego.unidades().containsKey(position)) {
			const unidad = juego.unidades().get(position)
			logica.apply(unidad)
		}
	}
}

