import wollok.game.*
import pepita.tactics.game.Initialization.*

class SelectorMenu {
	var property menu
	var property init = new Initialization(init={ self.reset() })
	var yRelativo = 0
	
	method itemSeleccionado(items) = items.get(items.size() - 1 - yRelativo) //TODO: uff emprolijar esta mierda
	
	method inicializar() { self.reset() }
	
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
	
	method reset() {
		yRelativo = menu.cantidadDeOpciones() - 1
	}
}
