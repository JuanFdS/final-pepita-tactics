import wollok.game.*
import pepita.tactics.game.MenuItem.*

object menuItemDisplays {
    const property asd = new MenuItemDisplay(text="asd")
    const property wosd = new MenuItemDisplay(text="wosd")
    const property lal = new MenuItemDisplay(text="lal")
    const property ataqueFuerte = new MenuItemDisplay(text="Ataque fuerte")
    const property ataqueDebil = new MenuItemDisplay(text="Ataque debil")
    const property moverse = new MenuItemDisplay(text="Moverse")
    const property atacar = new MenuItemDisplay(text="Atacar")

    method inicializar() {
        [asd, wosd, lal, ataqueFuerte, ataqueDebil, moverse, atacar].
            forEach { display => display.inicializar() }
    }
}

