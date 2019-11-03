import pepita.tactics.game.juego.*
import pepita.tactics.game.Promise.*
import pepita.tactics.model.esperando.*
import pepita.tactics.model.jugando.*
import pepita.tactics.model.Habilidad.*
import pepita.tactics.model.calculadorDePosicionesAlcanzables.*

class Personaje {
	var property position
	var property ataque = 30
	var property vida = 100
	var property velocidad = 5
	var estado = esperando
	var property habilidades = [explosion]
	
	method maxDistance()
	method esEquipoHeroe() = true

	method posicionesALasQueMePuedoMover() = calculadorDePosicionesAlcanzables.posicionesAlcanzables(position, (1 .. self.maxDistance()))

	method posicionesALasQuePuedoAtacar() = calculadorDePosicionesAlcanzables.posicionesAlcanzables(position, 1 .. 1)

	method usarHabilidadEn(enemigo, habilidad) = juego.ataqueFueRealizadoEn(enemigo.position(), habilidad).forEach({ x => habilidad.usarEn(enemigo) })
	
	method terminoTuTurno() {
		estado = esperando
	}
	
	method teToca() {
		estado = jugando
	}

	method atacar(enemigo) {
		enemigo.recibirDanio(ataque)
	}
	
	method validarQueEsTuTurno() {
		if(estado != jugando) {
			self.error("No es mi turno")
		}
	}
	
	method recibirDanio(unDanio) {
		vida = (vida - unDanio).max(0)
		if(self.derrotado()) juego.eliminarPersonaje(self)
	}
	
	method derrotado() = vida == 0
	
	override method toString() = self.identity().toString()
	
	method image() = estado.image(self)
	
	method imageEsperando()
	
	method imageJugando()
}
