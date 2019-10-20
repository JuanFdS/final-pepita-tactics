import wollok.game.*
import pepita.tactics.model.TilePintada.*


object juego {
	var property tiles = []

	method pintarPosiciones(posiciones) {
		tiles.forEach { tile => game.removeVisual(tile) }
		tiles = posiciones.map { posicion => new TilePintada(posicion=posicion) }
		tiles.forEach { tile => game.addVisual(tile) }
	}
}
