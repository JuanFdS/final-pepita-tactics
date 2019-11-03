import pepita.tactics.model.Personaje.*
import pepita.tactics.game.AnimatedSprite.*

class Enemy inherits Personaje {
	
	const activeSprite = new AnimatedSprite(name="personajes/orc/", quantityOfFrames=4)

	override method maxDistance() = 2
	method esEquipoHeroe() = false
	
	override method imageEsperando() = "personajes/orc/0.png"
	override method imageJugando() = activeSprite.image()

}

