import personas.*
import Carpas.*

class Rubia{
   var property lupulo
   var property pais
   var property graduacion
 
   

   }

class Negra{
	var property lupulo
	var property pais
	var property graduacion
	const graduacionReglamentaria
	
	method graduacion(){
	   graduacion = (graduacionReglamentaria.min(lupulo)* 2)
	   return graduacion
	}
}

class Roja inherits Negra{
	
	override method graduacion(){
		super()
		return graduacion * 1.25
	}

}
class Jarra{
	var property capacidadEnLitros
	var property marca
	const cerveza = []
	
	method agregarCerveza(birra){
		cerveza.add(birra)
	}
	method contenidoDeAlcohol(){
		return capacidadEnLitros * cerveza.sum({birra=>birra.graduacion() / 100})
	
	}
	method lupuloPorLitro(){
		return cerveza.sum({birra=>birra.lupulo() })
	}
	method graduacion(){
		return cerveza.sum({birra=>birra.graduacion()})
	}
	method nacionalidadDeJarras(){
		return cerveza.map({birra=>birra.pais()})
	}
}