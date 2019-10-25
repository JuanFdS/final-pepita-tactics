import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.Modo.*


class ModoLibre inherits Modo {
	override method accionPrincipal() {
		selector.conUnidadSeleccionada { unidad => 
			juego.cambiarModo(new ModoMovimiento(personaje=unidad))
		}
	}

	override method accionSecundaria() {
		selector.conUnidadSeleccionada { unidad => 
			juego.cambiarModo( new ModoAtaque(personaje=unidad))
		}
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

