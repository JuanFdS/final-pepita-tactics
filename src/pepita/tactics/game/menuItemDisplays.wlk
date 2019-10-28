import wollok.game.*
import pepita.tactics.game.MenuItem.*

object menuItemDisplays {
    const property ataqueFuerte = new MenuItemDisplay(text="Ataque fuerte")
    const property ataqueDebil = new MenuItemDisplay(text="Ataque debil")
    const property moverse = new MenuItemDisplay(text="Moverse")
    const property atacar = new MenuItemDisplay(text="Atacar")
    const property pasar = new MenuItemDisplay(text="Pasar")
	const property cancelar = new MenuItemDisplay(text="Cancelar")

    method inicializar() {
        [ataqueFuerte, ataqueDebil, moverse, atacar, cancelar, pasar].
            forEach { display => display.inicializar() }
    }
}

