import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*


class ModoMenu inherits Modo {
	const menu = juego.menuDePausa()
	const modoAnterior

	override method finalizarModo() {
		menu.remove()
	}
	
	override method inicializarModo() {
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
