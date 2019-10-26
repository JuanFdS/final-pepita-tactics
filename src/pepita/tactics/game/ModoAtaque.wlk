import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*

class ModoAtaque inherits Modo {

	const personaje

	override method inicializarModo() {
		menuDeAtaque.modoAtaque(self)
		juego.pintarPosiciones(personaje.posicionesALasQuePuedoAtacar())
	}

	override method finalizarModo() {
		juego.despintarPosiciones()
	}

	override method accionPrincipal() {
		if (self.esPosicionAlcanzable()) {
			selector.conUnidadSeleccionada { unidad => 
				juego.cambiarModo(new ModoMenu(modoAnterior=self, menu=menuDeAtaque.menu()))
			}
		} else {
			juego.cambiarModo(new ModoLibre())	
		}
	}

	method esPosicionAlcanzable() {
		const posicionesDisponibles = personaje.posicionesALasQuePuedoAtacar()
		return posicionesDisponibles.contains(selector.position())
	}
	
	method ataqueFuerte() {
		selector.conUnidadSeleccionada{ unidad => personaje.ataqueFuerte(unidad)}
		juego.cambiarModo(new ModoLibre())
	}
	
	method ataqueDebil() {
		selector.conUnidadSeleccionada{ unidad => personaje.ataqueDebil(unidad)}
		juego.cambiarModo(new ModoLibre())
	}

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

object menuDeAtaque {
	var property modoAtaque = null

	const property menu = new Menu(items = [
		new MenuItem(text="Ataque fuerte", accionPrincipal={ modoAtaque.ataqueFuerte() }),
		new MenuItem(text="Ataque debil",accionPrincipal= { modoAtaque.ataqueDebil() })])
		
	method inicializar() {
		menu.inicializar()
	}
}
