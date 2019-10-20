import wollok.game.*
import pepita.tactics.model.hero.*
import pepita.tactics.game.juego.*

object config {

	method width() = 20

	method height() = 20

	method configureGame() {
		game.width(self.width())
		game.height(self.height())
		self.addCharacters()
		self.addKeyMap()
	}

	method addCharacters() {
		game.addVisual(hero)
	}

	method addKeyMap() {
		keyboard.r().onPressDo { hero.meQuieroMover() }
		keyboard.down().onPressDo{ hero.position(hero.position().down(1))}
		keyboard.up().onPressDo{ hero.position(hero.position().up(1))}
		keyboard.left().onPressDo{ hero.position(hero.position().left(1))}
		keyboard.right().onPressDo{ hero.position(hero.position().right(1))}
	}

}

