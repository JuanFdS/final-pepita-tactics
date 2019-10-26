import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoAtaque.*


object modoLibre {
	
	method finalizarModo() {}
	
	method inicializarModo() {}

	method accionPrincipal() {
		selector.conUnidadSeleccionada { unidad => 
			juego.cambiarModo(new ModoMovimiento(personaje=unidad))
		}
	}

	method accionSecundaria() {
		selector.conUnidadSeleccionada { unidad => 
			juego.cambiarModo( new modoAtaque(personaje=unidad))
		}
	}
}

