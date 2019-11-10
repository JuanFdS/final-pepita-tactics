import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.model.selector.*
import pepita.tactics.model.Enemy.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.model.Heroe.*
import pepita.tactics.model.Habilidad.*
import pepita.tactics.game.clock.*
import pepita.tactics.game.TextDisplay.*
import pepita.tactics.model.Casa.*
import pepita.tactics.game.SideMenuDisplay.*

object config {

	method width() = 24

	method height() = 20

	method configureGame() {
		game.width(self.width())
		game.height(self.height())
		self.addClock()
		self.addVisuals()
		self.addKeyMap()
		juego.inicializar()
		
	}
	
	method addVisuals() {
		self.addBackground()
		self.addCharacters()
		self.addSelector()
		self.addSideMenu()
	}

	method addCharacters() {
		juego.agregarPersonaje(new Heroe(position=game.center().left(5), nombre="Adelaide"))
		juego.agregarPersonaje(new Heroe(position=game.center().left(5).up(3), nombre="Dorothy"))
		juego.agregarPersonaje(new Heroe(position=game.center().left(5).down(3), nombre="Sabrina"))
		
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(5).up(5), nombre="Draenor"))
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(7), nombre=""))
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(5).down(3), nombre=""))
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(2), nombre=""))
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(1).up(3), nombre=""))
		juego.agregarPersonaje(new Enemy(habilidades = [piedrazo, explosion], position=game.center().right(6).down(2), nombre=""))
		
		juego.agregarTile(new Casa(position=game.center().down(2).left(2)))
		juego.agregarTile(new Casa(position=game.center().down(2).left(3)))
		juego.agregarTile(new Casa(position=game.center().down(2).left(4)))
	}
	
	method addSelector() {
		game.addVisual(selector)
	}
	
	method addBackground() {
		game.addVisualIn(new Image(path="background.png"), game.origin())
	}
	
	method addSideMenu() {
		new SideMenuDisplay().draw()
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

