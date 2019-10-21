import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.modoLibre.*


class ModoMovimiento {
	const personaje

	method accionPrincipal() {
		if(self.esPosicionAlcanzable()) {
			juego.mover(personaje, selector.position())
		}
		juego.despintarPosiciones()
		juego.modo(modoLibre)
	}

	method accionSecundaria() {}


	method esPosicionAlcanzable() {
		const posicionesDisponibles = personaje.posicionesALasQueMePuedoMover()
		return posicionesDisponibles.contains(selector.position())
	}

}

