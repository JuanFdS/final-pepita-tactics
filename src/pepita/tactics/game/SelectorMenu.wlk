import wollok.game.*


class SelectorMenu {
	var property menu
	var property yRelativo = 0
	
	method x() = menu.position().x()
	
	method yInicial() = menu.position().y()

	method position() = game.at(self.x(), self.yInicial() + yRelativo)

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
