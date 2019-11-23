import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*

class ModoLibre inherits Modo {

	override method accionPrincipal() {
		selector.conUnidadSeleccionada{ unidad =>
			unidad.validarQueEsTuTurno()

			juego.cambiarModo(modoMenuDeHeroe.crear(unidad, self))
		}
	}

	override method accionSecundaria() {}
	
	override method personajeActivo() = false

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

