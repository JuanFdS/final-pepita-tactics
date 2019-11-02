object calculadorDePosicionesAlcanzables {
	method posicionesAlcanzables(desdeDonde, rangoDeDistancia) {
		var positions = []
		const maximaDistancia = rangoDeDistancia.end()
		const minimaDistancia = rangoDeDistancia.start()
		const top = desdeDonde.up(maximaDistancia)
		positions.add(top)
		const bottom = desdeDonde.down(maximaDistancia)
		positions.add(bottom)
		const farRight = desdeDonde.right(maximaDistancia)
		positions.add(farRight)
		const farLeft = desdeDonde.left(maximaDistancia)
		positions.add(farLeft)

		if(rangoDeDistancia.size() > 1) {
			(1..maximaDistancia-1).forEach{ y =>
				positions.add(top.down(y))
				positions.add(bottom.up(y))
				positions.add(farLeft.right(y))
				positions.add(farRight.left(y))
	
				(1 .. y).forEach{ x =>
					positions.add(top.down(y).right(x))
					positions.add(top.down(y).left(x))
					positions.add(bottom.up(y).right(x))
					positions.add(bottom.up(y).left(x))
				}
			}			
		}
		
		if(minimaDistancia > 1) {
			const posicionesExcluidas = self.posicionesAlcanzables(desdeDonde, 1 .. minimaDistancia - 1)
			positions.removeAll(posicionesExcluidas)
		}
		
		return positions
	}
}
