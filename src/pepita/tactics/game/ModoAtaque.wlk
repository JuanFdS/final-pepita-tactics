import pepita.tactics.model.selector.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.ModoLibre.*
import pepita.tactics.game.Modo.*
import pepita.tactics.game.ModoMenu.*
import pepita.tactics.game.Menu.*
import pepita.tactics.game.MenuItem.*
import pepita.tactics.game.menuItemDisplays.*
import pepita.tactics.game.ModoBloqueado.*

class ModoAtaque inherits Modo {

	const personaje
	const modoAnterior
	const habilidad

	override method inicializarModo() {
		juego.pintarPosiciones(self.posicionesAlcanzables(), "tileAtacable.png")
	}

	override method finalizarModo() {
		juego.despintarPosiciones()
	}

	override method accionPrincipal() {
		if (self.esPosicionAlcanzable()) {
			selector.conUnidadSeleccionada { unidad => 
				if(personaje.esEquipoHeroe() == unidad.esEquipoHeroe()) {
					self.error('Un amigo es una luz, no se la ataca')
				} else {
					juego.cambiarModo(new ModoBloqueado())
					self.realizarAtaqueEn(unidad)
				}
			}
		}
	}

	override method accionSecundaria() {
		juego.cambiarModo(modoAnterior)
	}
	
	method posicionesAlcanzables() = habilidad.posicionesAlcanzablesPara(personaje)

	method esPosicionAlcanzable() = self.posicionesAlcanzables().contains(selector.position())

	method realizarAtaqueEn(unidad) = personaje.usarHabilidadEn(unidad, habilidad).forEach({ x => juego.avanzarTurno() })

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

