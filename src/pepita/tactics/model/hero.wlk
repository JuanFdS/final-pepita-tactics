import wollok.game.*
import pepita.tactics.game.juego.*

object hero {

	var property maxDistance = 3
	var property position = game.center()

	method image() = "wizzart_f_hit_anim_f0.png"

	method meQuieroMover() {
		juego.pintarPosiciones(self.posicionesALasQueMePuedoMover())
	}

	method posicionesALasQueMePuedoMover() {
		var positions = []
		const top = position.up(maxDistance)
		positions.add(top)
		const bottom = position.down(maxDistance)
		positions.add(bottom)
		(maxDistance - 1).times{ y =>
			positions.add(top.down(y))
			positions.add(bottom.up(y))
			y.times{ x =>
				positions.add(top.down(y).right(x))
				positions.add(top.down(y).left(x))
				positions.add(bottom.up(y).right(x))
				positions.add(bottom.up(y).left(x))
			}
		}
		maxDistance.times { x =>
			positions.add(position.right(x))
			positions.add(position.left(x))
		}
		return positions
	}

}

