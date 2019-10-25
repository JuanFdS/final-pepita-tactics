import pepita.tactics.model.menu.*
import wollok.game.*


class SelectorMenu {
	const x = menu.position().x()
	const yInicial = menu.position().y()
	var property yRelativo = 0

	method position() = game.at(x, yInicial + yRelativo)

	method image() = "selectorMenu.png"

	method arriba() {
		yRelativo = (yRelativo + 1) % menu.cantidadDeOpciones()
	}

	method abajo() {
		var nuevoYRelativo = yRelativo - 1
		if(nuevoYRelativo - 1 < 0) {
			nuevoYRelativo = menu.cantidadDeOpciones() + nuevoYRelativo
		} 
		yRelativo = nuevoYRelativo % menu.cantidadDeOpciones()
	}
}
