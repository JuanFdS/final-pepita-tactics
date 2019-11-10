import wollok.game.*
import pepita.tactics.model.TilePintada.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.model.BarritaDeVida.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.TemporaryVisual.*
import pepita.tactics.model.selector.*
import pepita.tactics.game.AnimatedSprite.*
import pepita.tactics.game.OneTimeAnimation.*
import pepita.tactics.game.Turnometro.*
import pepita.tactics.game.config.*
import pepita.tactics.game.Promise.*


object juego {
	var property tilesAPintar = []
	var modo = new ModoLibre()
	var property unidades = new Dictionary()
	var turnometro
	var property tiles = new Dictionary()
	
	const barritasDeVidaDeUnidades = new Dictionary()
	
	method inicializar() {
		menuItemDisplays.inicializar()
		turnometro = new Turnometro(personajesOrdenados = unidades.values())
		self.cambiarModo(turnometro.personajeActivo().modoDeTuTurno())
	}
	
	method posicionEstaDesocupada(posicion) = !(unidades.containsKey(posicion) || tiles.containsKey(posicion))
	method personajeActivo() = modo.personajeActivo()

	method awaitFrames(frames) {
		const milliseconds = (frames * 1000.0 / config.framesPerSecond())
		return promise.esperarYHacer(milliseconds, {})		
	}
	
	method avanzarTurno() {
		turnometro.avanzarTurno()
		self.cambiarModo(turnometro.personajeActivo().modoDeTuTurno())
	}
	
	method cambiarModo(nuevoModo) {
		modo.finalizarModo()
		modo = nuevoModo
		modo.inicializarModo()
	}

	method mover(personaje, posicion) {
		if(personaje.position() != posicion) {
			if(!self.posicionEstaDesocupada(posicion)) {
				self.error("No se puede mover a esa posicion") 
			}
			unidades.remove(personaje.position())
			personaje.position(posicion)
			unidades.put(posicion, personaje)	
		}
	}

	method agregarPersonaje(personaje) {
		unidades.put(personaje.position(), personaje)
		game.addVisual(personaje)
		
		const barritaDeVida = new BarritaDeVida(personaje=personaje)
		game.addVisual(barritaDeVida)
		barritasDeVidaDeUnidades.put(personaje, barritaDeVida)
	}
	
	method agregarTile(tile) {
		tiles.put(tile.position(), tile)
	}
	
	method eliminarPersonaje(personaje) {
		const barritaDeVida = barritasDeVidaDeUnidades.get(personaje)
		unidades.remove(personaje.position())
		barritasDeVidaDeUnidades.remove(personaje)
		game.removeVisual(personaje)
		game.removeVisual(barritaDeVida)
		turnometro.remove(personaje)
	}

	method pintarPosiciones(posiciones, tileImagePath) {
		self.despintarPosiciones()
		tilesAPintar = posiciones.map { posicion => new TilePintada(position=posicion, image=tileImagePath) }
		tilesAPintar.forEach { tile => game.addVisual(tile) }
	}
	
	method despintarPosiciones() {
		tilesAPintar.forEach { tile => game.removeVisual(tile)}
		tilesAPintar.clear()
	}
	
	method personajes() = unidades.values()
	
	method ataqueFueRealizadoEn(position, habilidad) = new OneTimeAnimation(animatedSprite=habilidad.animacion()).drawIn(position.left(1).down(1))

	method accionPrincipal() {
		modo.accionPrincipal()
	}
	
	method accionSecundaria() {
		modo.accionSecundaria()
	}
	
	method start() {
		modo.start()
	}
	
	method abajo() {
		modo.abajo()
	}
	
	method derecha() {
		modo.derecha()
	}
	
	method izquierda() {
		modo.izquierda()
	}
	
	method arriba() {
		modo.arriba()
	}
}
