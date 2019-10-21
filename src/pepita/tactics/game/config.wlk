import wollok.game.*
import pepita.tactics.model.hero.*
import pepita.tactics.game.juego.*
import pepita.tactics.model.selector.*
import pepita.tactics.model.Enemy.*
import pepita.tactics.game.modoLibre.*


object config {

	method width() = 20

	method height() = 20

	method configureGame() {
		game.width(self.width())
		game.height(self.height())
		self.addCharacters()
		self.addSelector()
		self.addKeyMap()
	}

	method addCharacters() {
		hero.position(game.center())
		juego.agregarPersonaje(hero)
		juego.agregarPersonaje(new Enemy(position=game.center().right(3)))
	}
	
	method addSelector() {
		game.addVisual(selector)
	}

	method addKeyMap() {
	
		keyboard.down().onPressDo{ selector.position(selector.position().down(1))}
		keyboard.up().onPressDo{ selector.position(selector.position().up(1))}
		keyboard.left().onPressDo{ selector.position(selector.position().left(1))}
		keyboard.right().onPressDo{ selector.position(selector.position().right(1))}
		keyboard.z().onPressDo{ juego.accionPrincipal() }
		keyboard.x().onPressDo { juego.accionSecundaria() }
	}

}

