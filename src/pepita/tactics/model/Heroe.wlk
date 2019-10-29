import pepita.tactics.model.Personaje.*
import pepita.tactics.game.AnimatedSprite.*

class Heroe inherits Personaje {
	
	const activeSprite = new AnimatedSprite(name={"personajes/wizard/"}, quantityOfFrames={4}, speedFactor=0.7)
	var property maxDistance = 3
	
	override method imageEsperando() = "personajes/wizard/1.png"
	override method imageJugando() = activeSprite.image()
}

