// Sabores
object frutilla {}
object chocolate {}

object naranja {}
object vainilla {}

class Bombon {
  var peso = 15
  method precio() = 5
  method peso() = peso
  method sabor() = frutilla
  method libreGluten() = true

  method mordisco() {
    peso = ((peso * 0.8) - 1).max(0)
  }
}

class BombonDuro inherits Bombon {
  override method mordisco() {
    peso = (peso - 1).max(0)
  }

  method gradoDureza() {
    if (peso > 12) {
      return 3
    } else if (peso.between(8, 12)) {
      return 2
    } else {
      return 1
    }
  }
}

class Alfajor {
  var peso = 300
  method precio() = 12
  method peso() = peso
  method sabor() = chocolate
  method libreGluten() = false

  method mordisco() {
    peso = peso * 0.8
  }
}

class Caramelo {
  var peso = 5
  var sabor

  method precio() = 1
  method peso() = peso
  method sabor() = sabor
  method libreGluten() = false

  method mordisco() {
    peso = (peso - 1).max(0)
  }
}

class CarameloRelleno inherits Caramelo {
  override method precio() = super() + 1
  override method mordisco() {
    super()
    sabor = chocolate
  }
}

class Chupetin {
  var peso = 7
  method precio() = 2
  method peso() = peso
  method sabor() = naranja
  method libreGluten() = true

  method mordisco() {
    peso = if (peso < 2) peso * 0.9
  }
}

class Oblea {
  var peso = 250
  method precio() = 5
  method peso() = peso
  method sabor() = vainilla
  method libreGluten() = false

  method mordisco() {
    peso = if (peso < 70) peso * 0.5 else peso * 0.75
  }
}

class ObleaCrujiente inherits Oblea {
  var mordiscos = 0
  override method mordisco() {
    super()
    if (mordiscos < 3) {
      peso = (peso - 3).max(0)
    }
    mordiscos += 1
  }

  method estaDebil() = mordiscos > 3
}

class Chocolatin {
  var pesoInicial
  var peso = pesoInicial

  method precio() = 0.5 * pesoInicial
  method peso() = peso
  method sabor() = chocolate
  method libreGluten() = false

  method mordisco() {
    peso = (peso - 2).max(0)
  }
}

class ChocolatinVIP inherits Chocolatin {
  var humedad
  override method peso() {
    super() * (1 + humedad)
  }
}

class GolosinaBañada {
  var golosinaInterior
  var pesoBanio = 4
  var peso = golosinaInterior.peso() + pesoBanio
  method peso() = peso
  method precio() = golosinaInterior.precio() + 2
  method sabor() = golosinaInterior.sabor()
  method libreGluten() = golosinaInterior.libreGluten()
  method mordisco() {
    golosinaInterior.mordisco()
    pesoBanio = (pesoBanio - 2).max(0)
  }
}

class Pastilla {
  var peso = 5
  var libreGluten
  var sabor = frutilla
  method sabor() = sabor
  method precio() = if (libreGluten == true) 7 else 10
  method peso() = peso
  method libreGluten() = libreGluten

  method mordisco() {
    if (sabor == frutilla) {
      sabor = chocolate
    } else if {sabor == chocolate} {
      sabor = naranja
    } else if (sabor == naranja) {
      sabor = frutilla
    }
  }
}