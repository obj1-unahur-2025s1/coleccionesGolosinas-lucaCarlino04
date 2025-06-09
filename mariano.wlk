import golosinas.*

object mariano {
    var golosinas = [new Bombon(peso=5)]
    method golosinas() = golosinas
    
    method comprar(unaGolosina) {
        golosinas.add(unaGolosina)
    }
    method desechar(unaGolosina) {
        golosinas.remove(unaGolosina)
    }
    method cantidadDeGolosinas() {
        golosinas.size()
    }
    method tieneLaGolosina(unaGolosina) {
        return golosinas.contains(unaGolosina)
    }
    method probarGolosinas() {
        golosinas.forEach{ golosina => golosina.mordisco()}
    }
    method hayGolosinaSinTACC() {
        return golosinas.any { golosina => golosina.libreGluten() }
    }
    method preciosCuidados() {
        return golosinas.all { golosina => golosina.precio() <= 10}
    }
    method golosinaDeSabor(unSabor) {
        return golosinas.find {golosina => golosina.sabor() == unSabor}
    }
    method golosinasDeSabor(unSabor) {
        return golosinas.filter { golosina => golosina.sabor() == unSabor}
    }
    method sabores() {
        var sabores = #{}
        golosinas.forEach { golosina =>
            sabores.add{golosina.sabor()}
        }
        return sabores
    }
    method golosinaMasCara() {
        golosinas.max { golosina => golosina.precio()}
    }
    method pesoGolosinas() {
        return golosinas.sum{golosina => golosina.peso()}
    }

    method golosinasFaltantes(golosinasDeseadas) {
        golosinasDeseadas.filter {golosina => !golosinas.contains{golosina}}
    }
    method gustosFaltantes(gustosDeseados) {
        gustosDeseados.filter { sabor => !self.sabores().contains{sabor}}
    }

    method bañar(unaGolosina) {
        golosinas.comprar(new GolosinaBañada(golosinaInterior=unaGolosina))
    }
}
