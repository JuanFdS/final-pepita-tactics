import wollok.game.*
import pepita.tactics.game.TextDisplay.*
import pepita.tactics.model.selector.*

class SideMenuDisplay {
	
	const sideMenu = new Image(path="sidemenu/menu.png")
	const marcoPersonajeSeleccionado =  new Image(path="sidemenu/displayPersonaje.png")
	const displayPersonajeSeleccionado = new DisplayPersonajeSeleccionado()
	const displayNombre = new DisplayNombre(position=game.at(game.width() - 4, game.height() - 2))
	
	method draw() {
		game.addVisualIn(sideMenu, game.origin())
		game.addVisualIn(marcoPersonajeSeleccionado, game.at(game.width() - 4, game.height() - 4))
		game.addVisualIn(displayPersonajeSeleccionado, game.at(game.width() - 3, game.height() - 3))
		displayNombre.draw()
	}
	
	method remove() {
		game.removeVisual(sideMenu)
		game.removeVisual(marcoPersonajeSeleccionado)
		game.removeVisual(displayPersonajeSeleccionado)
		displayNombre.remove()
	}

}

class DisplayPersonajeSeleccionado {
	const property position
	method image() = selector.unidadSeleccionada({ empty }).imageEsperando()
}

object empty {
	method imageEsperando() = "empty.png"
	
	method nombre() = ""
}

class DisplayNombre {
	const displays = new Dictionary()
	const property position
	var displayActual = null
	
	method initialize() {
		displayActual = self.crearDisplayPara(empty)
		selector.subscribirse(self)
	}
	
	method draw() {
		const unidadSeleccionada = selector.unidadSeleccionada({ empty })
		const display = displays.getOrElse(unidadSeleccionada, {
			const nuevoDisplay = self.crearDisplayPara(unidadSeleccionada)
			displays.put(unidadSeleccionada, nuevoDisplay)
			return nuevoDisplay
		})
		displayActual = display
		display.draw()
	}
	
	method crearDisplayPara(unidad) = new TextDisplay(text="             " + unidad.nombre(),renglones=2,caracteresDeAncho=10, parent=self)
	
	method selectorSeMovio() {
		displayActual.remove()
		self.draw()
	}
}