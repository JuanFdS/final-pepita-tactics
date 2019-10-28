import wollok.game.*
import pepita.tactics.game.TextDisplay.*
import pepita.tactics.game.Initialization.*


class MenuItem {
	const display
	const accionPrincipal
	
	method drawIn(position) {
		display.drawIn(position)
	}
	
	method remove() {
		display.remove()
	}
	
	method accionPrincipal() {
		accionPrincipal.apply()
	}
}

class MenuItemDisplay {
	const text
	var box = null
	var textDisplay = null
	var property init = new Initialization(init={
		box = new MenuItemBox(parent=self)
		textDisplay = new MenuItemText(text=text, parent=self)
		textDisplay.inicializar()
	})
	var property position = null

	method inicializar() {
		init.run(self)
	}

	method drawIn(aPosition) {
		self.position(aPosition)
		self.inicializar()
		box.draw()
		textDisplay.draw()
	}
	
	method remove() {
		box.remove()
		textDisplay.remove()
	}
}

class MenuItemBox {
	const image = "menu.png"
	const parent

	method image() = image

	method position() = parent.position()	

	method draw() {
		game.addVisual(self)
	}
	
	method remove() {
		game.removeVisual(self)
	}
}

class MenuItemText {
	const text
	const parent
	var property init = new Initialization(init={
		textDisplay = new TextDisplay(text=text, caracteresDeAncho=20, renglones=1, parent=self)
		textDisplay.inicializar()
	})
	var textDisplay = null

	method inicializar() {
		init.run(self)
	}	
	
	method position() = parent.position()
	
	method draw() {
		self.inicializar()
		textDisplay.draw()
	}
	
	method remove() {
		textDisplay.remove()
	}
}