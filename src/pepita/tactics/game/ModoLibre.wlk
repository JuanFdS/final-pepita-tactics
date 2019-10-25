import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*

class ModoLibre inherits Modo {

	override method accionPrincipal() {
		selector.conUnidadSeleccionada{ unidad =>
			juego.cambiarModo(new ModoMenu(modoAnterior = self, menu = juego.menuDeHeroe()))
		}
	}

	override method accionSecundaria() {}

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

