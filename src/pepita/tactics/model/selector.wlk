import wollok.game.*

object selector {

	var property position = game.center()
	var property personajeSeleccionado

	method image() = "tileSeleccionada.png"

	method seleccionarPersonaje(personaje) {
		personaje.meQuieroMover()
		personajeSeleccionado = personaje
	}

	method seleccionarPosicion() {
		if (personajeSeleccionado != null && self.esPosicionAlcanzable()) {
			personajeSeleccionado.position(position)
			personajeSeleccionado.finalizarMovimiento()
			personajeSeleccionado = null
		}
	}
	
	method esPosicionAlcanzable() {
		const posicionesDisponibles = personajeSeleccionado.posicionesALasQueMePuedoMover()
		return posicionesDisponibles.contains(position)		
	}

}

