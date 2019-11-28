import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.model.selector.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoLibre.*


object modoMenuDeHeroe {
	method crear(heroe, modoAnterior) {
		const modoMenuDeHeroe = new ModoMenu(position = heroe.position(), modoAnterior=modoAnterior)

		const modoMenuDeHabilidades = new ModoMenu(position = heroe.position(), modoAnterior=modoMenuDeHeroe)
		heroe.habilidades().forEach { habilidad =>
			const nuevoModoDeAtaque = new ModoAtaque(modoAnterior=modoMenuDeHabilidades, personaje=heroe, habilidad=habilidad)
			modoMenuDeHabilidades.agregarCambioDeModo(habilidad.menuItemDisplay(), { nuevoModoDeAtaque })
		}

		modoMenuDeHeroe.agregarCambioDeModo(menuItemDisplays.moverse(), { new ModoMovimiento(personaje=heroe, desdeDonde=heroe.position()) })
		modoMenuDeHeroe.agregarCambioDeModo(menuItemDisplays.atacar(), { modoMenuDeHabilidades })
		modoMenuDeHeroe.agregarCambioDeModo(menuItemDisplays.cancelar(), { new ModoLibre() })
		modoMenuDeHeroe.agregarAccion(menuItemDisplays.pasar(), { juego.avanzarTurno() })

		return modoMenuDeHeroe
	}
}

class ModoMenu inherits Modo {
	var property menu = new Menu(items = [])
	const modoAnterior
	const position

	override method finalizarModo() {
		menu.remove()
	}
	
	override method inicializarModo() {
		selector.mover({ pos => position })
		menu.draw()
	}

	override method accionPrincipal() {
		menu.accionPrincipal()
	}

	override method accionSecundaria() {
		juego.cambiarModo(modoAnterior)
	}
	
	override method start() {
		juego.cambiarModo(modoAnterior)
	}
	
	override method arriba() {
		menu.opcionAnterior()
	}
	
	override method abajo() {
		menu.opcionSiguiente()
	}
	
	method agregarAccion(display, accion) {
		menu.agregarAccion(display, accion)
	}
	
	method agregarCambioDeModo(display, obtenerNuevoModo) {
		menu.agregarAccion(display, { juego.cambiarModo(obtenerNuevoModo.apply()) })
	}
	
	method removerAccionConDisplay(display) {
		menu.removerAccionConDisplay(display)
	}
}

