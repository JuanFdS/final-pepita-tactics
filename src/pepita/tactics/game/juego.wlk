import wollok.game.*
import pepita.tactics.model.TilePintada.*
import pepita.tactics.game.modoLibre.*


object juego {
	var property tiles = []
	var property modo = modoLibre
	var property unidades = new Dictionary()

	method mover(personaje, posicion) {
		unidades.remove(personaje.position())
		personaje.position(posicion)
		unidades.put(posicion, personaje)
		
	}

	method agregarPersonaje(personaje) {
		unidades.put(personaje.position(), personaje)
		game.addVisual(personaje)
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

	method accionPrincipal() {
		modo.accionPrincipal()
	}
	
	method accionSecundaria() {
		modo.accionSecundaria()
	}
}
