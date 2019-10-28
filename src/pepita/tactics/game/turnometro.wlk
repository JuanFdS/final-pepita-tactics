object turnometro {
	var ordenPersonajes = []
	
	method init(unidades) {
		const personajes = unidades.copy()
		personajes.sortBy({p,p2 => p.velocidad() > p2.velocidad()})
		ordenPersonajes = personajes
	}
	
	method avanzarTurno() {
		const personajeActivo = self.personajeActivo()
		ordenPersonajes.remove(personajeActivo)
		ordenPersonajes.add(personajeActivo)
	}
	
	method personajeActivo() = ordenPersonajes.first()
	
}
