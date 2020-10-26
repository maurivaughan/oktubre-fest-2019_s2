import cervezasyjarras.*
import personas.*

class Carpas {
	var property limiteDeGente
	var property tieneMusica
	var property vendeCervezaMarca
	const personas = []
	
	method entrarALaCarpa(persona){
		if (personas.size()<=limiteDeGente and not persona.estarEbrio()) {personas.add(persona)} 
		if (personas.size()> limiteDeGente){personas.remove(persona) console.println("NO PUEDE INGRESAR A LA CARPA")}
	}
	method cantidadDePersonas(){
		return personas.size()
	}
	method removerPersona(persona){
		personas.remove(persona)
	}
	method dejarIngresar(persona){
		return self.cantidadDePersonas()< limiteDeGente and not persona.estarEbrio()
	}
	method servir(jarra ,persona){
		if (not personas.map({person=>person}).contains(persona)){persona.removerJarra(jarra) console.println("la persona no se encuentra en la carpa")} else {persona.comprar(jarra)}
		return jarra.capacidadEnLitros() 
		}
	method ebriosEmpedernidos(){
		return personas.count({jarra=>jarra.jarrasDeMasDeUnLitro()})		
	}
		

		
	}


