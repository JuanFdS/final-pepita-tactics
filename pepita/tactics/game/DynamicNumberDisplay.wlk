import wollok.game.*

class DynamicDigitDisplay {

	const calcularDigito
	const modifier
	const parent

	method image() = "font8bits/" + calcularDigito.apply() + modifier + ".png"

	method position() = parent.position()
	
	method draw() {
		game.addVisual(self)
	}
	
	method remove() {
		game.removeVisual(self)
	}
}

class Digitos {
	const calcularNumero
	
	method numero() = calcularNumero.apply()
	
	method centenas() = self.numero().div(100)
	
	method decenas() = self.numero().rem(100).div(10)
	
	method unidades() = self.numero().rem(10)
}

object renglonSuperior {
	const property left = "-topLeft"
	const property center = "-topCenter"
	const property right = "-topRight"
	const property verticalPosition = "-top"
} 

object renglonInferior {
	const property left = "-bottomLeft"
	const property center = "-bottomCenter"
	const property right = "-bottomRight"
	const property verticalPosition = "-bottom" 
}

class DynamicNumberDisplay {
	const calcularNumero
	const renglon
	const parent
	
	method position() = parent.position()

	method draw() {
		game.addVisual(self)
	}
	
	method remove() {
		game.removeVisual(self)
	}
	
	method image() = "font8bits/" + calcularNumero.apply().toString() + renglon.verticalPosition() + ".png" 
}

