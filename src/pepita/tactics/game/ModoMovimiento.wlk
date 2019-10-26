import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*


class ModoMovimiento inherits Modo {
	const personaje
	
	override method inicializarModo() {
		juego.pintarPosiciones(self.posicionesAlcanzables())
	}

	override method finalizarModo() {
		juego.despintarPosiciones()
	}

	override method accionPrincipal() {
		if(self.posicionesAlcanzables().contains(self.posicionObjetivo())) {
			juego.mover(personaje, self.posicionObjetivo())
			juego.cambiarModo(new ModoMenu(modoAnterior=new ModoLibre(), menu=juego.menuDeHeroe()))
		} else {
			juego.cambiarModo(new ModoLibre())	
		}
	}

	method posicionesAlcanzables() = personaje.posicionesALasQueMePuedoMover().filter { posicion => juego.posicionEstaDesocupada(posicion) } 

	method posicionObjetivo() = selector.position()
	
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

