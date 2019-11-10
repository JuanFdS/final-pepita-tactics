import pepita.tactics.game.Modo.*
import pepita.tactics.model.selector.*

class ModoBloqueado inherits Modo {
	override method inicializarModo() {
		selector.invisible(true)
	}
	
	override method finalizarModo() {
		selector.invisible(false)
	}

	override method accionSecundaria() {}
	
	override method start() {}
	
	override method personajeActivo() = false
}

