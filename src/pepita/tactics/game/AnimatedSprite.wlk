import wollok.game.*

import game.clock.*

class AnimatedSprite {
	//name y quantityOfFrames son bloques porque muchas veces voy a necesitar poner en ellos valores de los objetos que se están inicializando, por ej:
	//class A {
	// const sprite = new AnimatedSprite(name=self.name(), quantityOfFrames=5)
	// method name() = "lalala"
	// }
	//El problema ahí es que self.name() no existe al momento de tratar de settear el const sprite. Si en cambio hacemos:
	//class A {
	// const sprite = new AnimatedSprite(name= { self.name() }, quantityOfFrames = { 5 })
	// method name() = "lalala"
	//}
	// dejo de necesitar que el self.name() se pueda calcular mientras se instancia el objeto, con que se pueda calcular en el momento que vaya a mandar
	// apply() al bloque es suficiente. Es una forma de "hacer lazy" algo que no lo era.
	const name
	const imageExtension = "png"
	const quantityOfFrames
	const speedFactor = 1
	var imagenes = []
	const timeSinceStarted = clock.timePassed()

	method timePassedSinceStarted() = clock.timePassed() - timeSinceStarted
	
	method hasLoopedAtLeastOnce() = self.framesSinceStarted() >= quantityOfFrames.apply()
	
	method framesSinceStarted() = self.timePassedSinceStarted() * speedFactor

	method frameNumber() = self.framesSinceStarted() % quantityOfFrames.apply() 

	method image() {
		if(imagenes.isEmpty()) self.inicializarImagenes()
		return imagenes.get(self.frameNumber())
	}

	method inicializarImagenes() {
		//Hackazo para que ande un poquito mas rapido la animacion, creo todos los strings al principio en vez de calcular el nombre en cada frame 
		//Seguro se podría hacer más simple
		const frames = quantityOfFrames.apply()
		(0..frames - 1).forEach{ frameNumber =>
			const imageName = name.apply() + frameNumber + "." + imageExtension  
			imagenes.add(imageName)
		}
	}

}


