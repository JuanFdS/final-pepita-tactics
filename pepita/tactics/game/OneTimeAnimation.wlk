import wollok.game.*

class OneTimeAnimation {
	const animatedSprite

	method image() = animatedSprite.image()

	method drawIn(position) {
		game.addVisualIn(self, position)

		return animatedSprite.loopAtLeastOnce().forEach({x => game.schedule(0, { game.removeVisual(self) } ) })
	}
}
