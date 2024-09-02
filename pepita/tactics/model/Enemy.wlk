import pepita.tactics.model.Personaje.*
import pepita.tactics.game.AnimatedSprite.*
import pepita.tactics.game.ModoEnemigo.*
import pepita.tactics.game.juego.*
import pepita.tactics.game.Promise.*


class Enemy inherits Personaje {
	
	const activeSprite = new AnimatedSprite(name="personajes/orc/", quantityOfFrames=4)

	override method maxDistance() = 2
	override method esEquipoHeroe() = false
	
	override method imageEsperando() = "personajes/orc/0.png"
	override method imageJugando() = activeSprite.image()
	
	override method modoDeTuTurno() = new ModoEnemigo(personaje = self)
	
	method actuar() {
		const enemigoElegido = self.enemigoObjetivo()
		const movimientosPosibles = self.posicionesALasQueMePuedoMover()
		return self.anunciarMovimiento(movimientosPosibles).then({ x =>
			self.concretarMovimiento(self.mejorPosicion(movimientosPosibles, enemigoElegido))			
		}).then({ x =>
			self.intentarUsarHabilidad(enemigoElegido)
		})
	}
	
	method enemigoObjetivo() {
		const enemigoMasCercano = juego.personajes().filter { personaje => personaje.esEquipoHeroe() }.min { personaje => personaje.position().distance(position) }
		return enemigoMasCercano
	}
	
	method anunciarMovimiento(posiciones) {
		juego.pintarPosiciones(posiciones, "tileAlcanzable.png")
		return juego.awaitFrames(10)
	}
	
	method mejorPosicion(posicionesPosibles, enemigo) = posicionesPosibles.min({ posicion => posicion.distance(enemigo.position()) })
	
	method concretarMovimiento(posicionDestino) {
		juego.mover(self, posicionDestino)
		juego.despintarPosiciones()
		return juego.awaitFrames(10)
	}
	
	method habilidadesPosiblesContra(enemigo) = habilidades.filter({ habilidad => habilidad.posicionesAlcanzablesPara(self).contains(enemigo.position()) })
	
	method elegirHabilidadContra(habilidades, enemigo) = habilidades.anyOne()
	
	method intentarUsarHabilidad(enemigo) {
		const habilidades = self.habilidadesPosiblesContra(enemigo)
		if(habilidades.isEmpty()) {
			return promise.resuelta(unit)
		} else {
			const habilidad = self.elegirHabilidadContra(habilidades, enemigo)
			return self.usarHabilidadEn(enemigo, habilidad)	
		}
	}
}

