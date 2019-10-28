import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.model.selector.*
import pepita.tactics.model.Enemy.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.model.Heroe.*
import pepita.tactics.game.clock.*
import pepita.tactics.game.TextDisplay.*

object config {

	method width() = 20

	method height() = 20

	method configureGame() {
		game.width(self.width())
		game.height(self.height())
		self.addClock()
		self.addCharacters()
		self.addSelector()
		self.addKeyMap()
		juego.inicializar()
	}

	method addCharacters() {
		juego.agregarPersonaje(new Heroe(position=game.center()))
		
		juego.agregarPersonaje(new Heroe(position=game.center().left(3)))
		
		juego.agregarPersonaje(new Enemy(position=game.center().right(3)))
	}
	
	method addSelector() {
		game.addVisual(selector)
	}
	
	method addClock() {
		game.onTick(60, "Advance time", { clock.advanceTime(1)})
	}
	

	method addKeyMap() {
	
		keyboard.down().onPressDo{ juego.abajo() }
		keyboard.up().onPressDo{ juego.arriba() }
		keyboard.left().onPressDo{ juego.izquierda() }
		keyboard.right().onPressDo{ juego.derecha() }
		keyboard.enter().onPressDo { juego.start() }
		keyboard.z().onPressDo{ juego.accionPrincipal() }
		keyboard.x().onPressDo { juego.accionSecundaria() }
	}

}

