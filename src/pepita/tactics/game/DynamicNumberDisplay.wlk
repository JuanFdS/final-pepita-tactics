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
} 

object renglonInferior {
	const property left = "-bottomLeft"
	const property center = "-bottomCenter"
	const property right = "-bottomRight" 
}

class DynamicNumberDisplay {
	const calcularNumero
	const renglon
	const parent
	var visuals = null
	
	method initialize() {
		visuals = self.calculateVisuals()
	}
	
	method calculateVisuals() {
		const digitos = new Digitos(calcularNumero = calcularNumero)
		return [new DynamicDigitDisplay(calcularDigito = { digitos.centenas() }, modifier = renglon.left(), parent = self),
				new DynamicDigitDisplay(calcularDigito = { digitos.decenas() }, modifier = renglon.center(), parent = self),
				new DynamicDigitDisplay(calcularDigito = { digitos.unidades() }, modifier = renglon.right(), parent = self)
		]
	}
	
	method position() = parent.position()

	method draw() {
		visuals.forEach { visual => visual.draw() }
	}
	
	method remove() {
		visuals.forEach { visual => visual.remove() }
	}
}

