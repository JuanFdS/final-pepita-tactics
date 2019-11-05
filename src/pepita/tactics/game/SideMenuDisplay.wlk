import wollok.game.*
import pepita.tactics.game.TextDisplay.*
import pepita.tactics.model.selector.*

class SideMenuDisplay {

	const sideMenu = new Image(path = "sidemenu/menu.png")
	const marcoPersonajeSeleccionado = new Image(path = "sidemenu/displayPersonaje.png")
	const displayPersonajes = new DisplayDePersonajes(position = game.at(game.width() - 4, game.height() - 2))

	method draw() {
		game.addVisualIn(sideMenu, game.origin())
		game.addVisualIn(marcoPersonajeSeleccionado, game.at(game.width() - 4, game.height() - 4))
		displayPersonajes.draw()
	}

	method remove() {
		game.removeVisual(sideMenu)
		game.removeVisual(marcoPersonajeSeleccionado)
		displayPersonajes.remove()
	}

}

class DisplayRetrato {
	const personaje
	const property position

	method image() = personaje.imageEsperando()
	
	method draw() {
		game.addVisual(self)
	}
	
	method remove() {
		game.removeVisual(self)
	}
}

object empty {

	method imageEsperando() = "empty.png"

	method nombre() = ""

}

class DisplayParaUnPersonaje {

	const personaje
	const property position
	var displayNombre = null
	var displayRetrato = null

	method initialize() {
		displayNombre = new TextDisplay(text = "             " + personaje.nombre(), renglones = 2, caracteresDeAncho = 10, parent = self)
		displayRetrato = new DisplayRetrato(personaje=personaje, position = position.down(1).right(1))
	}

	method draw() {
		displayNombre.draw()
		displayRetrato.draw()
	}

	method remove() {
		displayNombre.remove()
		displayRetrato.remove()
	}

}

class DisplayDePersonajes {

	const displays = new Dictionary()
	const property position
	var displayActual = null

	method initialize() {
		displayActual = self.displayPara(empty)
		selector.subscribirse(self)
	}

	method draw() {
		const unidadSeleccionada = selector.unidadSeleccionada({ empty })
		displayActual = self.displayPara(unidadSeleccionada)
		displayActual.draw()
	}

	method displayPara(unidad) = displays.getOrElse(unidad, {
		const nuevoDisplay = new DisplayParaUnPersonaje(personaje = unidad, position = position)
		displays.put(unidad, nuevoDisplay)
		return nuevoDisplay
	})

	method selectorSeMovio() {
		displayActual.remove()
		self.draw()
	}

}

