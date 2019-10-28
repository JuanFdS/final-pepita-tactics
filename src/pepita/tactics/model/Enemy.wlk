import pepita.tactics.model.Personaje.*
import pepita.tactics.game.AnimatedSprite.*

class Enemy inherits Personaje {
	
	const sprite = new AnimatedSprite(name={"personajes/orc/"}, quantityOfFrames={4})

	override method maxDistance() = 2

	method image() = sprite.image()

}

