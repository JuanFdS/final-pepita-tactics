import pepita.tactics.model.selector.*
import pepita.tactics.model.hero.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.modoMovimiento.*
import pepita.tactics.game.modoAtaque.*


object modoLibre {

	method accionPrincipal() {
		selector.conUnidadSeleccionada { unidad => 
			juego.pintarPosiciones(unidad.posicionesALasQueMePuedoMover())
			juego.modo(new ModoMovimiento(personaje=unidad))
		}
	}

	method accionSecundaria() {
		selector.conUnidadSeleccionada { unidad => 
			juego.pintarPosiciones(hero.posicionesALasQuePuedoAtacar())
			juego.modo(modoAtaque)
		}
	}


}

