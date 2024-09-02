import pepita.tactics.game.Modo.*
import pepita.tactics.model.selector.*
import wollok.game.*
import pepita.tactics.game.juego.*

class ModoEnemigo inherits Modo {

	const personaje

	override method inicializarModo() {
		selector.invisible(true)
		game.say(personaje, ">:D")
		juego.awaitFrames(15).then{ x => personaje.actuar() }.forEach{ x => juego.avanzarTurno()}
	}

	override method finalizarModo() {
		selector.invisible(false)
	}

	override method accionSecundaria() {
	}

	override method start() {
	}

	override method personajeActivo() = false

}

