import pepita.tactics.model.selector.*
import pepita.tactics.model.hero.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.modoLibre.*


class modoAtaque {
	const personaje

	method accionPrincipal() {
		if(self.esPosicionAlcanzable()) {
			selector.conUnidadSeleccionada {unidad =>
				personaje.atacar(unidad)
			}
		}		
		juego.despintarPosiciones()
		juego.modo(modoLibre)
	}
	
	method accionSecundaria() {}

	method esPosicionAlcanzable() {
		const posicionesDisponibles = personaje.posicionesALasQuePuedoAtacar()
		return posicionesDisponibles.contains(selector.position())
	}
}
