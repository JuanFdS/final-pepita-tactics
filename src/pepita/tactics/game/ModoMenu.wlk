import wollok.game.*
import pepita.tactics.model.menu.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.Modo.*
import pepita.tactics.model.SelectorMenu.*


class ModoMenu inherits Modo {
	const modoAnterior
	const selectorMenu = new SelectorMenu()

	override method finalizarModo() {
		game.removeVisual(menu)
		game.removeVisual(selectorMenu)
	}
	
	override method inicializarModo() {
		game.addVisual(menu)
		game.addVisual(selectorMenu)
	}

	override method accionPrincipal() {
	}

	override method accionSecundaria() {
		juego.cambiarModo(modoAnterior)
	}
	
	override method start() {
		juego.cambiarModo(modoAnterior)
	}
	
	override method arriba() {
		selectorMenu.arriba()
	}
	
	override method abajo() {
		selectorMenu.abajo()
	}
	
}
