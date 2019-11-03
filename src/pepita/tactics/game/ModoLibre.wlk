import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoMovimiento.*
import pepita.tactics.game.ModoAtaque.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*

class ModoLibre inherits Modo {

	override method accionPrincipal() {
		selector.conUnidadSeleccionada{ unidad =>
			unidad.validarQueEsTuTurno()

			const modoMenuDeHeroe = new ModoMenu(position = unidad.position(), modoAnterior=self)

			const modoMenuDeHabilidades = new ModoMenu(position = unidad.position(), modoAnterior=modoMenuDeHeroe)
			unidad.habilidades().forEach { habilidad =>
				const nuevoModoDeAtaque = new ModoAtaque(modoAnterior=modoMenuDeHabilidades, personaje=unidad, habilidad=habilidad)
				modoMenuDeHabilidades.agregarCambioDeModo(habilidad.menuItemDisplay(), { nuevoModoDeAtaque })
			}

			modoMenuDeHeroe.agregarCambioDeModo(menuItemDisplays.moverse(), { new ModoMovimiento(personaje=unidad, desdeDonde=unidad.position()) })
			modoMenuDeHeroe.agregarCambioDeModo(menuItemDisplays.atacar(), { modoMenuDeHabilidades })
			modoMenuDeHeroe.agregarCambioDeModo(menuItemDisplays.cancelar(), { new ModoLibre() })

			juego.cambiarModo(modoMenuDeHeroe)
		}
	}

	override method accionSecundaria() {}
	
	override method personajeActivo() = false

	override method arriba() {
		selector.arriba()
	}

	override method abajo() {
		selector.abajo()
	}

	override method izquierda() {
		selector.izquierda()
	}

	override method derecha() {
		selector.derecha()
	}

}

