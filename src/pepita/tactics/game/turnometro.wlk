import pepita.tactics.model.selector.*

object turnometro {
	var ordenPersonajes = []
	
	method init(unidades) {
		const personajes = unidades.copy()
		personajes.sortBy({p,p2 => p.velocidad() > p2.velocidad()})
		ordenPersonajes = personajes
		self.posicionarSelector()
		self.personajeActivo().teToca()
	}
	
	method avanzarTurno() {
		const personajeActivo = self.personajeActivo()
		personajeActivo.terminoTuTurno()
		ordenPersonajes.remove(personajeActivo)
		ordenPersonajes.add(personajeActivo)
		self.posicionarSelector()
		self.personajeActivo().teToca()
	}
	
	method posicionarSelector() {
		selector.position(self.personajeActivo().position())
	}
	
	method personajeActivo() = ordenPersonajes.first()
	
	method remove(personaje) {
		ordenPersonajes.remove(personaje)
	}
	
}
