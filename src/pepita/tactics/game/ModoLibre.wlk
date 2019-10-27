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
			const menuDeHeroe = new Menu(items = [
				new MenuItem(display = menuItemDisplays.moverse(),
					    	 accionPrincipal= { juego.cambiarModo(new ModoMovimiento(personaje=unidad)) }),
				new MenuItem(display = menuItemDisplays.atacar(),
							 accionPrincipal= { juego.cambiarModo(new ModoAtaque(personaje=unidad)) }),
				new MenuItem(display = menuItemDisplays.cancelar(),
							 accionPrincipal= { juego.cambiarModo(new ModoLibre()) })
				])

			juego.cambiarModo(new ModoMenu(modoAnterior = self, menu = menuDeHeroe))
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

