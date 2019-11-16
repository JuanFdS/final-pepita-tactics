import wollok.game.*
import pepita.tactics.game.MenuItem.*

object menuItemDisplays {
    var property moverse = null
    var property atacar = null
    var property pasar = null
	var property cancelar = null
	var property explosion = null
	var property piedrazo = null
	var property tornado = null
	
	method inicializar() {
		moverse = new MenuItemDisplay(text="Moverse")
		atacar = new MenuItemDisplay(text="Atacar")
		pasar = new MenuItemDisplay(text="Pasar")
		cancelar = new MenuItemDisplay(text="Cancelar")
		explosion = new MenuItemDisplay(text="Explosion")
		piedrazo = new MenuItemDisplay(text="Piedrazo")
		tornado = new MenuItemDisplay(text="Tornado")
	}
}

