import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.turnometro.*

class ModoMenu inherits Modo {
	var property menu = new Menu(items = [new MenuItem(display=menuItemDisplays.cancelar(), accionPrincipal = { juego.cambiarModo(modoAnterior) })])
	const modoAnterior

	override method finalizarModo() {
		menu.remove()
	}
	
	override method inicializarModo() {
		turnometro.posicionarSelector()
		menu.draw()
	}

	override method accionPrincipal() {
		menu.accionPrincipal()
	}

	override method accionSecundaria() {
		juego.cambiarModo(modoAnterior)
	}
	
	override method start() {
		juego.cambiarModo(modoAnterior)
	}
	
	override method arriba() {
		menu.opcionAnterior()
	}
	
	override method abajo() {
		menu.opcionSiguiente()
	}
	
}
