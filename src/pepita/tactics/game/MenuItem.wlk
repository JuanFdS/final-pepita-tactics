import wollok.game.*
import pepita.tactics.game.TextDisplay.*
import pepita.tactics.game.Initialization.*


class MenuItem {
	var property init = new Initialization(init={
		box = new MenuItemBox(menuItem = self)
		menuText = new MenuItemText(text=text, menuItem=self)
		menuText.inicializar()
	})
	
	const accionPrincipal
	const text
	var property position = null
	var box = null
	var menuText = null
	
	method inicializar() { init.run(self) }
	
	method drawIn(aPosition) {
		position = aPosition
		self.inicializar()
		box.draw()
		menuText.draw()
	}
	
	method remove() {
		box.remove()
		menuText.remove()
	}
	
	method accionPrincipal() {
		accionPrincipal.apply()
	}
}

class MenuItemBox {
	const menuItem
	const property image = "menu.png"
	
	method position() = menuItem.position()
	
	method draw() {
		game.addVisual(self)
	}
	
	method remove() {
		game.removeVisual(self)
	}
}

class MenuItemText {
	const menuItem
	const text
	var property init = new Initialization(init={
		textDisplay = new TextDisplay(text=text, caracteresDeAncho=20, renglones=1, parent=self)
		textDisplay.inicializar()
	})

	var textDisplay = null
	
	method inicializar() {
		init.run(self)
	}	
	
	method position() = menuItem.position()
	
	method draw() {
		self.inicializar()
		textDisplay.draw()
	}
	
	method remove() {
		textDisplay.remove()
	}
}