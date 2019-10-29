import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.juego.*
import pepita.tactics.model.selector.*


class Modo {
	
	method finalizarModo() {}
	
	method inicializarModo() {}

	method accionPrincipal() {}

	method accionSecundaria() {
		juego.cambiarModo(new ModoLibre())
	}
	
	method personajeActivo() = true
	
	method start() {
		juego.cambiarModo(new ModoMenu(modoAnterior=self, position=selector.position()))
	}
	
	method arriba() {}
	
	method abajo() {}
	
	method derecha() {}
	
	method izquierda() {}
}
