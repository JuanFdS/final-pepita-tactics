import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*

class ModoAtaque {

	const personaje

	method inicializarModo() {
		juego.pintarPosiciones(personaje.posicionesALasQuePuedoAtacar())
	}

	method finalizarModo() {
		juego.despintarPosiciones()
	}

	method accionPrincipal() {
		if (self.esPosicionAlcanzable()) {
			selector.conUnidadSeleccionada{ unidad => personaje.atacar(unidad)}
		}
		juego.cambiarModo(new ModoLibre())
	}

	method accionSecundaria() {
	}

	method esPosicionAlcanzable() {
		const posicionesDisponibles = personaje.posicionesALasQuePuedoAtacar()
		return posicionesDisponibles.contains(selector.position())
	}

}

