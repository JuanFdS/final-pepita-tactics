import wollok.game.*
import pepita.tactics.game.juego.*


object selector {

	var property position = game.center()

	method image() = "tileSeleccionada.png"
	
	method conUnidadSeleccionada(logica) {
		if(juego.unidades().containsKey(position)) {
			const unidad = juego.unidades().get(position)
			logica.apply(unidad)
		}
	}
}

