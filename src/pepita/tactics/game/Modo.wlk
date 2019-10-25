import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.juego.*


class Modo {
	
	method finalizarModo() {}
	
	method inicializarModo() {}

	method accionPrincipal() {}

	method accionSecundaria() {}
	
	method start() {
		juego.cambiarModo(new ModoMenu(modoAnterior=self))
	}
	
	method arriba() {}
	
	method abajo() {}
	
	method derecha() {}
	
	method izquierda() {}
}
