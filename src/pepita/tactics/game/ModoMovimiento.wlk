import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.ModoAtaque.*

class ModoMovimiento inherits Modo {
	const personaje
	const desdeDonde
	
	override method inicializarModo() {
		juego.mover(personaje, desdeDonde)
		juego.pintarPosiciones(self.posicionesAlcanzables(), "tileAlcanzable.png")
	}

	override method finalizarModo() {
		juego.despintarPosiciones()
	}

	override method accionPrincipal() {
		if(self.posicionesAlcanzables().contains(self.posicionObjetivo())) {
			juego.mover(personaje, self.posicionObjetivo())
			
			const modoMenuTrasMoverse = modoMenuDeHeroe.crear(personaje, self)
			modoMenuTrasMoverse.removerAccionConDisplay(menuItemDisplays.moverse())

			juego.cambiarModo(modoMenuTrasMoverse)
		} else {
			juego.cambiarModo(new ModoLibre())	
		}
	}

	method posicionesAlcanzables() = personaje.posicionesALasQueMePuedoMover() 

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

