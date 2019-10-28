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


object juego {
	var property tiles = []
	var modo = new ModoLibre()
	var property unidades = new Dictionary()
	
	const barritasDeVidaDeUnidades = new Dictionary()
	
	method inicializar() {
		menuItemDisplays.inicializar()
	}
	
	method posicionEstaDesocupada(posicion) = !unidades.containsKey(posicion)
	method personajeActivo() = modo.personajeActivo()
	
	method cambiarModo(nuevoModo) {
		modo.finalizarModo()
		modo = nuevoModo
		modo.inicializarModo()
	}

	method mover(personaje, posicion) {
		unidades.remove(personaje.position())
		personaje.position(posicion)
		unidades.put(posicion, personaje)
		
	}

	method agregarPersonaje(personaje) {
		unidades.put(personaje.position(), personaje)
		game.addVisual(personaje)
		
		const barritaDeVida = new BarritaDeVida(personaje=personaje)
		game.addVisual(barritaDeVida)
		barritasDeVidaDeUnidades.put(personaje, barritaDeVida)
	}
	
	method eliminarPersonaje(personaje) {
		const barritaDeVida = barritasDeVidaDeUnidades.get(personaje)
		unidades.remove(personaje.position())
		barritasDeVidaDeUnidades.remove(personaje)
		game.removeVisual(personaje)
		game.removeVisual(barritaDeVida)
	}

	method pintarPosiciones(posiciones) {
		self.despintarPosiciones()
		tiles = posiciones.map { posicion => new TilePintada(posicion=posicion) }
		tiles.forEach { tile => game.addVisual(tile) }
	}
	
	method despintarPosiciones() {
		tiles.forEach { tile => game.removeVisual(tile)}
		tiles.clear()
	}
	
	method ataqueFueRealizadoEn(position) {
//		const animacionDeAtaque = new AnimatedSprite(name = { "habilidades/cosaRoja/FX" }, quantityOfFrames= { 15 })
		const animacionDeAtaque = new AnimatedSprite(name = { "habilidades/explosionRosa/" }, quantityOfFrames= { 82 }, speedFactor = 3)
		new OneTimeAnimation(animatedSprite=animacionDeAtaque).drawIn(position.left(1).down(1))
	}

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
