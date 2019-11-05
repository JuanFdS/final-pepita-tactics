import pepita.tactics.model.selector.*

class Turnometro {
	const personajesOrdenados
	
	method initialize() {
		personajesOrdenados.sortBy({p,p2 => p.velocidad() > p2.velocidad()})
		self.posicionarSelector()
		self.personajeActivo().teToca()
	}
	
	method avanzarTurno() {
		const personajeActivo = self.personajeActivo()
		personajeActivo.terminoTuTurno()
		personajesOrdenados.remove(personajeActivo)
		personajesOrdenados.add(personajeActivo)
		self.posicionarSelector()
		self.personajeActivo().teToca()
	}
	
	method posicionarSelector() {
		selector.mover({ pos => self.personajeActivo().position()})
	}
	
	method personajeActivo() = personajesOrdenados.first()
	
}
