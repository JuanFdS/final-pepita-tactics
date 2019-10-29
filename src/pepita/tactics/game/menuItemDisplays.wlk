import wollok.game.*
import pepita.tactics.game.MenuItem.*

object menuItemDisplays {
    const property moverse = new MenuItemDisplay(text="Moverse")
    const property atacar = new MenuItemDisplay(text="Atacar")
    const property pasar = new MenuItemDisplay(text="Pasar")
	const property cancelar = new MenuItemDisplay(text="Cancelar")
	const property explosion = new MenuItemDisplay(text="Explosion")
	const property piedrazo = new MenuItemDisplay(text="Piedrazo")

    method inicializar() {
        [moverse, atacar, cancelar, pasar, explosion, piedrazo].
            forEach { display => display.inicializar() }
    }
}

