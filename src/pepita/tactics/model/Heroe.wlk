import pepita.tactics.model.Personaje.*
import pepita.tactics.game.AnimatedSprite.*

class Heroe inherits Personaje {
	
	const sprite = new AnimatedSprite(name={"personajes/wizard/"}, quantityOfFrames={4}, speedFactor=0.7)

	var property maxDistance = 3

	method image() = sprite.image()

}

