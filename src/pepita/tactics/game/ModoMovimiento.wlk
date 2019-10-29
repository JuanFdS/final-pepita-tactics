import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.turnometro.*

class ModoMovimiento inherits Modo {
	const personaje
	const desdeDonde
	
	override method inicializarModo() {
		juego.mover(personaje, desdeDonde)
		juego.pintarPosiciones(self.posicionesAlcanzables())
	}

	override method finalizarModo() {
		juego.despintarPosiciones()
	}

	override method accionPrincipal() {
		if(self.posicionesAlcanzables().contains(self.posicionObjetivo())) {
			juego.mover(personaje, self.posicionObjetivo())
			
			const nuevoModoMenu = new ModoMenu(modoAnterior=self, position=personaje.position())

			const terminarTurno = {
				turnometro.avanzarTurno()
				juego.cambiarModo(new ModoLibre())
			}

			const menuTrasMoverse = new Menu(items=[
				new MenuItem(display=menuItemDisplays.atacar(), accionPrincipal = { juego.cambiarModo(new ModoAtaque(modoAnterior=nuevoModoMenu, personaje=personaje)) }),
				new MenuItem(display=menuItemDisplays.cancelar(), accionPrincipal = { juego.cambiarModo(self) }),
				new MenuItem(display=menuItemDisplays.pasar(), accionPrincipal = terminarTurno)])
			nuevoModoMenu.menu(menuTrasMoverse)
			
			juego.cambiarModo(nuevoModoMenu)
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

