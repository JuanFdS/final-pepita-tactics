import pepita.tactics.game.Modo.*
import pepita.tactics.game.juego.*
import wollok.game.*
import pepita.tactics.model.selector.*

class ModoTransicion inherits Modo {
	const transicion
	const siguiente
	
	override method inicializarModo() {
		selector.invisible(true)
		transicion.forEach({ x =>
			selector.invisible(false)
			juego.cambiarModo(siguiente)
		})
	}

	override method accionSecundaria() {}
	
	override method start() {}
	
	override method personajeActivo() = false
}

