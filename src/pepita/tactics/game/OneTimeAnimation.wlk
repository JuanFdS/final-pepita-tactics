import wollok.game.*

class OneTimeAnimation {
	const animatedSprite

	method image() {
		if(animatedSprite.hasLoopedAtLeastOnce()) {
			game.schedule(0, { game.removeVisual(self)})
		}
		return animatedSprite.image()
	}
	
	method drawIn(position) {
		game.addVisualIn(self, position)
	}
}
