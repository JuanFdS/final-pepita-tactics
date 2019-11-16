import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.AnimatedSprite.*
import pepita.tactics.model.calculadorDePosicionesAlcanzables.*

class Habilidad {
	method menuItemDisplay()
	method animacion()
	method usarEn(unidad)
	method posicionesAlcanzablesPara(unidad)
	method nombre()
}

object explosion inherits Habilidad {
	override method menuItemDisplay() = menuItemDisplays.explosion()
	override method animacion() = new AnimatedSprite(name = "habilidades/explosionRosa/", quantityOfFrames= 82, speedFactor = 5)
	override method usarEn(unidad) {
		unidad.recibirDanio(30)
	}
	override method posicionesAlcanzablesPara(unidad) = calculadorDePosicionesAlcanzables.posicionesAlcanzables(unidad.position(), 2 .. 3)
	override method nombre() = "Explosion"
	method posicionDeAnimacion(position) = position.left(1).down(1)
}

object piedrazo inherits Habilidad {
	override method menuItemDisplay() = menuItemDisplays.piedrazo()
	override method animacion() = new AnimatedSprite(name = "habilidades/earth/weak/", quantityOfFrames= 36, speedFactor = 1)
	override method usarEn(unidad) {
		unidad.recibirDanio(50)
	}
	override method posicionesAlcanzablesPara(unidad) = calculadorDePosicionesAlcanzables.posicionesAlcanzables(unidad.position(), 1 .. 1)
	override method nombre() = "Piedrazo"
	method posicionDeAnimacion(position) = position.left(1).down(1)
}

object tornado inherits Habilidad {
	override method menuItemDisplay() = menuItemDisplays.tornado()
	override method animacion() = new AnimatedSprite(name = "habilidades/tornado/", quantityOfFrames= 54, speedFactor = 1)
	override method usarEn(unidad) {
		unidad.recibirDanio(20)
	}
	override method posicionesAlcanzablesPara(unidad) = calculadorDePosicionesAlcanzables.posicionesAlcanzables(unidad.position(), 1 .. 5)
	override method nombre() = "Tornado"
	method posicionDeAnimacion(position) = position.left(8).down(5)
}
