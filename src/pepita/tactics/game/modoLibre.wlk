import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoAtaque.*


object modoLibre {

	method accionPrincipal() {
		selector.conUnidadSeleccionada { unidad => 
			juego.pintarPosiciones(unidad.posicionesALasQueMePuedoMover())
			juego.modo(new ModoMovimiento(personaje=unidad))
		}
	}

	method accionSecundaria() {
		selector.conUnidadSeleccionada { unidad => 
			juego.pintarPosiciones(unidad.posicionesALasQuePuedoAtacar())
			juego.modo( new modoAtaque(personaje=unidad))
		}
	}


}

