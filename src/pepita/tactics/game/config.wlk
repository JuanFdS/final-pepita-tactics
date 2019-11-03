import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.model.selector.*
import pepita.tactics.model.Enemy.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.model.Heroe.*
import pepita.tactics.model.Habilidad.*
import pepita.tactics.game.clock.*
import pepita.tactics.game.TextDisplay.*

object background {
	const property position = game.origin()
	
	const property image = "background.png"
}

object config {

	method width() = 20

	method height() = 20

	method configureGame() {
		game.width(self.width())
		game.height(self.height())
		game.addVisual(background)
		self.addClock()
		self.addCharacters()
		self.addSelector()
		self.addKeyMap()
		juego.inicializar()
		
	}

	method addCharacters() {
		juego.agregarPersonaje(new Heroe(position=game.center()))
		
		juego.agregarPersonaje(new Heroe(position=game.center().left(3)))
		
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(3)))
	}
	
	method addSelector() {
		game.addVisual(selector)
	}
	
	method framesPerSecond() = 17
	
	method addClock() {
		game.onTick(1000 / self.framesPerSecond(), "Advance time", { clock.advanceTime(1)})
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

