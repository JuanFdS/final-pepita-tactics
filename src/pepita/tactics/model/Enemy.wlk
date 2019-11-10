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
		const posicionesDelEnemigo = juego.personajes().filter { personaje => personaje.esEquipoHeroe() }.map { personaje => personaje.position() }
		const posicionDeEnemigoMasCercano = posicionesDelEnemigo.min { posicion => posicion.distance(position) }
		const movimientosPosibles = self.posicionesALasQueMePuedoMover()
		juego.pintarPosiciones(movimientosPosibles, "tileAlcanzable.png")
		return juego.awaitFrames(10).then({ x =>
			const posicionDeseada = movimientosPosibles.min({ posicion => posicion.distance(posicionDeEnemigoMasCercano) })
			juego.despintarPosiciones()
			juego.mover(self, posicionDeseada)	
			return juego.awaitFrames(10)
		}).then({ x => 
			if(habilidades.any { habilidad => habilidad.posicionesAlcanzablesPara(self).contains(posicionDeEnemigoMasCercano) }) {
				const habilidad = habilidades.find { habilidad => habilidad.posicionesAlcanzablesPara(self).contains(posicionDeEnemigoMasCercano) }
				const enemigo = juego.unidades().get(posicionDeEnemigoMasCercano)
				return self.usarHabilidadEn(enemigo, habilidad)
			} else {
				return promise.resuelta(unit)
			}
		})
//		then({ x =>
//			console.println("3")
//			if(habilidades.any { habilidad => habilidad.posicionesAlcanzablesPara(self).contains(posicionDeEnemigoMasCercano) }) {
//				console.println("4")
//				const habilidad = habilidades.find { habilidad => habilidad.posicionesALasQuePuedeAtacar(self) }
//				const enemigo = juego.unidades().get(posicionDeEnemigoMasCercano)
//				return self.usarHabilidadEn(enemigo, habilidad)
//			} else {
//				console.println("1")
//				return promise.resuelta(unit)	
//			}	
//		})	
	}
}

