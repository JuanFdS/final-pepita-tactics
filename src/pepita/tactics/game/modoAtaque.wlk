import pepita.tactics.model.selector.*
import pepita.tactics.model.hero.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.modoLibre.*


object modoAtaque {

	method accionPrincipal() {
		juego.despintarPosiciones()
		juego.modo(modoLibre)
	}
	
	method accionSecundaria() {}

}
