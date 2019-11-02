import wollok.game.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.model.selector.*
import pepita.tactics.game.ModoAtaque.*


class ModoMenu inherits Modo {
	var property menu = new Menu(items = [])
	const modoAnterior
	const position

	override method finalizarModo() {
		menu.remove()
	}
	
	override method inicializarModo() {
		selector.position(position)
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
}

object modoMenuDeHabilidades {
	method crear(position, modoAnterior, unidad) {
		const nuevoModoMenu = new ModoMenu(modoAnterior=modoAnterior, position=position)
	 	const menuitemsDeAtaques = unidad.habilidades().map { habilidad =>
	 		new MenuItem(display = habilidad.menuItemDisplay(),
				 accionPrincipal = { juego.cambiarModo(new ModoAtaque(modoAnterior=self, personaje=unidad, habilidad=habilidad)) }
	 		)
	 	}
		const nuevoMenu = new Menu(items=menuitemsDeAtaques)
	 	nuevoModoMenu.menu(nuevoMenu)
	 	return nuevoModoMenu
	}
}
