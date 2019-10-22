import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.modoLibre.*


class ModoMovimiento {
	const personaje
	
	method inicializarModo() {
		juego.pintarPosiciones(self.posicionesAlcanzables())
	}

	method finalizarModo() {
		juego.despintarPosiciones()
	}

	method accionPrincipal() {
		if(self.posicionesAlcanzables().contains(self.posicionObjetivo())) {
			juego.mover(personaje, self.posicionObjetivo())
		}
		juego.cambiarModo(modoLibre)
	}

	method accionSecundaria() {}

	method posicionesAlcanzables() = personaje.posicionesALasQueMePuedoMover().filter { posicion => juego.posicionEstaDesocupada(posicion) } 

	method posicionObjetivo() = selector.position()

}

