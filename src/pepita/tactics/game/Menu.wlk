import pepita.tactics.model.selector.*
import wollok.game.*
import pepita.tactics.game.SelectorMenu.*

class Menu {
	const items
	const selectorMenu = new SelectorMenu()
	
	method position() = selector.position().right(1)
	
	method cantidadDeOpciones() = items.size()
	
	method draw() {
		selectorMenu.menu(self)
		var pos = self.position()
		items.reverse().forEach { item =>
			game.addVisualIn(item, pos)
			pos = pos.up(1)
		}
		game.addVisual(selectorMenu)
	}
	
	method remove() {
		items.forEach { item => game.removeVisual(item) }
		game.removeVisual(selectorMenu)
	}
	
	method opcionSiguiente() {
		selectorMenu.abajo()
	}
	
	method opcionAnterior() {
		selectorMenu.arriba()	
	}
}
