import pepita.tactics.model.Personaje.*

class Enemy inherits Personaje {

	override method maxDistance() = 2
	method esEquipoHeroe() = false

	method image() = "masked_orc_idle_anim_f0.png"

}

