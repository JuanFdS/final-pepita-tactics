import wollok.game.*
import pepita.tactics.game.juego.*

object hero {

	var property maxDistance = 3
	var property position = game.center()

	method image() = "wizzart_f_hit_anim_f0.png"

	method meQuieroMover() {
		juego.pintarPosiciones(self.posicionesALasQueMePuedoMover())
	}
	
	method quieroAtacar() {
		juego.pintarPosiciones(self.posicionesALasQuePuedoAtacar())
	}

	method finalizarMovimiento() {
		juego.despintarPosiciones()
	}

	method posicionesALasQueMePuedoMover() = self.posicionesPosibles(1 .. maxDistance)

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

}

