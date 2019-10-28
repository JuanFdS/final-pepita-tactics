object turnometro {
	var ordenPersonajes = []
	
	method init(unidades) {
		const personajes = unidades.copy()
		personajes.sortBy({p,p2 => p.velocidad() > p2.velocidad()})
		ordenPersonajes = personajes
		self.personajeActivo().teToca()
	}
	
	method avanzarTurno() {
		const personajeActivo = self.personajeActivo()
		personajeActivo.terminoTuTurno()
		ordenPersonajes.remove(personajeActivo)
		ordenPersonajes.add(personajeActivo)
		self.personajeActivo().teToca()
	}
	
	method personajeActivo() = ordenPersonajes.first()
	
}
