import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.AnimatedSprite.*
import pepita.tactics.model.calculadorDePosicionesAlcanzables.*

class Habilidad {
	method menuItemDisplay()
	method animacion()
	method usarEn(unidad)
	method posicionesAlcanzablesPara(unidad)
}

object explosion inherits Habilidad {
	override method menuItemDisplay() = menuItemDisplays.explosion()
	override method animacion() = new AnimatedSprite(name = "habilidades/explosionRosa/", quantityOfFrames= 82, speedFactor = 5)
	override method usarEn(unidad) {
		unidad.recibirDanio(50)
	}
	override method posicionesAlcanzablesPara(unidad) = calculadorDePosicionesAlcanzables.posicionesAlcanzables(unidad.position(), 2 .. 3)
}

object piedrazo inherits Habilidad {
	override method menuItemDisplay() = menuItemDisplays.piedrazo()
	override method animacion() = new AnimatedSprite(name = "habilidades/earth/weak/", quantityOfFrames= 36, speedFactor = 1)
	override method usarEn(unidad) {
		unidad.recibirDanio(40)
	}
	override method posicionesAlcanzablesPara(unidad) = calculadorDePosicionesAlcanzables.posicionesAlcanzables(unidad.position(), 1 .. 1)
}