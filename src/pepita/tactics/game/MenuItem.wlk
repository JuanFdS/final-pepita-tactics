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
	const box
	const textDisplay
	var property position = null
	
	method initialize() {
		box = new MenuItemBox(parent=self)
		textDisplay = new MenuItemText(text=text, parent=self)
	}

	method drawIn(aPosition) {
		self.position(aPosition)
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
	const textDisplay

	method initialize() {
		textDisplay = new TextDisplay(text=text, caracteresDeAncho=20, renglones=1, parent=self)
	}
	
	method position() = parent.position()
	
	method draw() {
		textDisplay.draw()
	}
	
	method remove() {
		textDisplay.remove()
	}
}