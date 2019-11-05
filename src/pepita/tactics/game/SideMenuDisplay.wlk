import wollok.game.*
import pepita.tactics.game.TextDisplay.*
import pepita.tactics.model.selector.*

class SideMenuDisplay {
	
	const sideMenu = new Image(path="sidemenu/menu.png")
	const marcoPersonajeSeleccionado =  new Image(path="sidemenu/displayPersonaje.png")
	const displayPersonajeSeleccionado = new DisplayPersonajeSeleccionado()
	
	method draw() {
		game.addVisualIn(sideMenu, game.origin())
		game.addVisualIn(marcoPersonajeSeleccionado, game.at(game.width() - 4, game.height() - 4))
		game.addVisualIn(displayPersonajeSeleccionado, game.at(game.width() - 3, game.height() - 3))
	}
	
	method remove() {
		game.removeVisual(sideMenu)
		game.removeVisual(marcoPersonajeSeleccionado)
		game.removeVisual(displayPersonajeSeleccionado)
	}

}

class DisplayPersonajeSeleccionado {
	method image() = selector.unidadSeleccionada({ empty }).imageEsperando()
}

object empty {
	method imageEsperando() = "empty.png"
}