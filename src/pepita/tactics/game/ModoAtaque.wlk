import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Modo.*

class ModoAtaque inherits Modo {

	const personaje

	override method inicializarModo() {
		juego.pintarPosiciones(personaje.posicionesALasQuePuedoAtacar())
	}

	override method finalizarModo() {
		juego.despintarPosiciones()
	}

	override method accionPrincipal() {
		if (self.esPosicionAlcanzable()) {
			selector.conUnidadSeleccionada{ unidad => personaje.atacar(unidad)}
		}
		juego.cambiarModo(new ModoLibre())
	}

	method esPosicionAlcanzable() {
		const posicionesDisponibles = personaje.posicionesALasQuePuedoAtacar()
		return posicionesDisponibles.contains(selector.position())
	}
	
	override method arriba() {
		selector.arriba()
	}
	
	override method abajo() {
		selector.abajo()
	}
	
	override method izquierda() {
		selector.izquierda()
	}
	
	override method derecha() {
		selector.derecha()
	}

}

