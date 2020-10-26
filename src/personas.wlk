import cervezasyjarras.*
import Carpas.*

class Persona {
	var property peso
	var property escucharMusica
	var property nivelDeAguante
	const cantJarrasDeCerveza = []
	const carpas = []
	
	method estarEbrio(){
	  if (cantJarrasDeCerveza.size() == 0){return false}else {}
	  return (cantJarrasDeCerveza.all({birra=>birra.contenidoDeAlcohol() * peso > nivelDeAguante}))
	  
	}
	method cantidadDeJarras(){
		return cantJarrasDeCerveza.size()
	}
	method comprar(jarra){
		cantJarrasDeCerveza.add(jarra)
	}
	method removerJarra(jarra){
		cantJarrasDeCerveza.remove(jarra)
	}
	method totalDeAlcohol(){
	return	cantJarrasDeCerveza.sum({birra=>birra.contenidoDeAlcohol()})
	}
	method agregarCarpa(carpa){
		carpas.add(carpa)
	}
	method puedeEntrarALaCarpa(carpa){
		return carpa.cantidadDePersonas()< carpa.limiteDeGente() and not self.estarEbrio()
}
    method jarrasDeMasDeUnLitro(){
    	return cantJarrasDeCerveza.all({jarra=>jarra.capacidadEnLitros()>=1})
    }
    method nacionalidadDeJarras(){
    	return cantJarrasDeCerveza.map({jarra=>jarra.nacionalidadDeJarras()})
    }
}

class PersonaBelga inherits Persona{
    method gustarCerveza(marca){
		return cantJarrasDeCerveza.filter({birra=>birra.lupuloPorLitro() > 4 }).map({birra=>birra.marca()}).contains(marca)
}
    method nombreDeCerveza(){
		return cantJarrasDeCerveza.filter({birra=>birra.lupuloPorLitro()> 4}).map({birra=>birra.marca()})
}
    method quiereEntrarAUnaCarpa(nombreDeCarpa){
		return self.nombreDeCerveza().contains(nombreDeCarpa.vendeCervezaMarca()) and self.escucharMusica() == nombreDeCarpa.tieneMusica()

}
    method patriota(){
    	return (cantJarrasDeCerveza.all({jarra=>jarra.nacionalidadDeJarras().contains("belgica")}))
    } 

}
class PersonaCheca inherits Persona{
	method gustarCerveza(marca){
		return cantJarrasDeCerveza.filter({birra=>birra.graduacion() > 8 }).map({birra=>birra.marca()}).contains(marca)
	}
	method nombreDeCerveza(){
		return cantJarrasDeCerveza.filter({birra=>birra.graduacion()>8}).map({birra=>birra.marca()})
	}
    method quiereEntrarAUnaCarpa(nombreDeCarpa){
		return self.nombreDeCerveza().contains(nombreDeCarpa.vendeCervezaMarca()) and self.escucharMusica() == nombreDeCarpa.tieneMusica()
    }
    method patriota(){
    	return (cantJarrasDeCerveza.all({jarra=>jarra.nacionalidadDeJarras().contains("checoslovaquia")}))
    }

}
class PersonaAlemana inherits Persona{
	method gustarCerveza(marca){
		return cantJarrasDeCerveza.any({birra=>birra.marca() == marca})
  }
  method nombreDeCerveza(){
		return cantJarrasDeCerveza.map({birra=>birra.marca()})
    }
    method quiereEntrarAUnaCarpa(nombreDeCarpa){
		return self.nombreDeCerveza().contains(nombreDeCarpa.vendeCervezaMarca()) and self.escucharMusica() == nombreDeCarpa.tieneMusica()and nombreDeCarpa.cantidadDePersonas().even()

   }
    method patriota(){
    	return (cantJarrasDeCerveza.all({jarra=>jarra.nacionalidadDeJarras().contains("alemania")}))
}

}

