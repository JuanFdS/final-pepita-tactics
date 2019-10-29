import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.AnimatedSprite.*

class Habilidad {
	method menuItemDisplay()
	method animacion()
	method usarEn(unidad)
}

object explosion inherits Habilidad {
	override method menuItemDisplay() = menuItemDisplays.explosion()
	override method animacion() = new AnimatedSprite(name = { "habilidades/explosionRosa/" }, quantityOfFrames= { 82 }, speedFactor = 3)
	override method usarEn(unidad) {
		unidad.recibirDanio(50)
	}
}

object piedrazo inherits Habilidad {
	method menuItemDisplay() = menuItemDisplays.piedrazo()
	method animacion() = new AnimatedSprite(name = { "habilidades/earth/weak/"}, quantityOfFrames= { 36 }, speedFactor = 1)
	override method usarEn(unidad) {
		unidad.recibirDanio(40)
	}
}