import wollok.game.*

import game.clock.*
import pepita.tactics.game.juego.*

class AnimatedSprite {
	const name
	const imageExtension = "png"
	const quantityOfFrames
	const speedFactor = 1
	var imagenes = null
	const timeSinceStarted = clock.timePassed()
	var property loopAtLeastOnce = null
	
	method initialize() {
		imagenes = (0..quantityOfFrames - 1).map{ frameNumber => name + frameNumber + "." + imageExtension }
		loopAtLeastOnce = juego.awaitFrames(quantityOfFrames / speedFactor)
	}

	method timePassedSinceStarted() = clock.timePassed() - timeSinceStarted
	
	method framesSinceStarted() = self.timePassedSinceStarted() * speedFactor

	method frameNumber() = self.framesSinceStarted() % quantityOfFrames 

	method image() = imagenes.get(self.frameNumber())
}


