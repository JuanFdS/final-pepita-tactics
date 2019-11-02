import pepita.tactics.model.selector.*
import wollok.game.*
import pepita.tactics.game.SelectorMenu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.Initialization.*
import pepita.tactics.game.juego.*

class Menu {
	const items = []
	var property init = new Initialization(init = {
		selectorMenu.menu(self)
		selectorMenu.inicializar()
	}, onRefresh = { selectorMenu.reset() })
	const selectorMenu = new SelectorMenu()

	method position() = selector.position().right(1)

	method cantidadDeOpciones() = items.size()
	
	method inicializar() { init.run(self) }

	method draw() {
		self.inicializar()
		var pos = self.position()
		items.reverse().forEach{ item =>
			item.drawIn(pos)
			pos = pos.up(1)
		}
		game.addVisual(selectorMenu)
	}

	method agregarAccion(display, accion) {
		const nuevoItem = new MenuItem(display = display, accionPrincipal = accion)
		items.add(nuevoItem)
	}

	method remove() {
		items.forEach{ item => item.remove()}
		game.removeVisual(selectorMenu)
	}

	method opcionSiguiente() {
		selectorMenu.abajo()
	}

	method opcionAnterior() {
		selectorMenu.arriba()
	}
	
	method accionPrincipal() {
		selectorMenu.itemSeleccionado(items).accionPrincipal()
	}

}

