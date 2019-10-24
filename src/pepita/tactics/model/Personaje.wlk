import pepita.tactics.game.juego.*

class Personaje {
	var property position
	var property ataque = 100
	var property vida = 100
	
	method maxDistance()
	
	method meQuieroMover() {
		juego.pintarPosiciones(self.posicionesALasQueMePuedoMover())
	}
	
	method quieroAtacar() {
		juego.pintarPosiciones(self.posicionesALasQuePuedoAtacar())
	}

	method posicionesALasQueMePuedoMover() = self.posicionesPosibles(1 .. self.maxDistance())

	method posicionesALasQuePuedoAtacar() = self.posicionesPosibles(1 .. 1)

	method posicionesPosibles(rangoDeDistancia) {
		var positions = []
		const maximaDistancia = rangoDeDistancia.end()
		const top = position.up(maximaDistancia)
		positions.add(top)
		const bottom = position.down(maximaDistancia)
		positions.add(bottom)
		positions.add(position.right(maximaDistancia))
		positions.add(position.left(maximaDistancia))
		if(rangoDeDistancia.size() > 1) {
			(rangoDeDistancia.start()..rangoDeDistancia.end()-1).forEach{ y =>
				positions.add(top.down(y))
				positions.add(bottom.up(y))
				positions.add(position.right(y))
				positions.add(position.left(y))
	
				(1 .. y).forEach{ x =>
					positions.add(top.down(y).right(x))
					positions.add(top.down(y).left(x))
					positions.add(bottom.up(y).right(x))
					positions.add(bottom.up(y).left(x))
				}
			}			
		}
		return positions
	}

	method atacar(enemigo) {
		enemigo.recibirDanio(ataque)
	}
	
	method recibirDanio(unDanio) {
		vida = (vida - unDanio).max(0)
		if(self.derrotado()) juego.eliminarPersonaje(self)
	}
	
	method derrotado() = vida == 0
	
	override method toString() = self.identity().toString()
}
