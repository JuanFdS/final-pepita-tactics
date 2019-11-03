import wollok.game.*
import pepita.tactics.game.MenuItem.*

object menuItemDisplays {
    const property moverse = new MenuItemDisplay(text="Moverse")
    const property atacar
    const property pasar
	const property cancelar
	const property explosion
	const property piedrazo
	
	method inicializar() {
		moverse = new MenuItemDisplay(text="Moverse")
		atacar = new MenuItemDisplay(text="Atacar")
		pasar = new MenuItemDisplay(text="Pasar")
		cancelar = new MenuItemDisplay(text="Cancelar")
		explosion = new MenuItemDisplay(text="Explosion")
		piedrazo = new MenuItemDisplay(text="Piedrazo")
	}
}

