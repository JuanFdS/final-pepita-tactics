import wollok.game.*
import pepita.tactics.model.TilePintada.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.model.BarritaDeVida.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.model.selector.*


object juego {
	var property tiles = []
	var modo = new ModoLibre()
	var property unidades = new Dictionary()
	
	const property menuDePausa = new Menu(items=[new MenuItem(text="asd", accionPrincipal={console.println("asd")}),
												 new MenuItem(text="wosd",accionPrincipal={console.println("wosd")}),
												 new MenuItem(text="lal",accionPrincipal={console.println("lal")})
	])
	
	const property menuDeHeroe = new Menu(items = [
		new MenuItem(text="Moverse",accionPrincipal= {
			selector.conUnidadSeleccionada({ unidad => self.cambiarModo(new ModoMovimiento(personaje=unidad)) })
		}),
		new MenuItem(text="Atacar", accionPrincipal={
			selector.conUnidadSeleccionada({ unidad => self.cambiarModo(new ModoAtaque(personaje=unidad)) })
		})])
	
	const barritasDeVidaDeUnidades = new Dictionary()
	
	method inicializar() {
		menuDePausa.inicializar()
		menuDeHeroe.inicializar()
		menuDeAtaque.inicializar()
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
