import aparatosYpacientes.*
import rutina.*
object centro {
	var property aparatos=[]
	var property personas=[]
	method  aparatosColores(){
		return aparatos.map({aparato=>aparato.color()})
	}
	method totalColores(){
		return self.aparatosColores().asSet()
	}
	method personasmenores(){
		return personas.filter({persona=>persona.edad()<8})
	}
	method totalPersonaNoCumplen(){
	personas.count({persona=>not persona.rutina().puedeHacerRutina()})
	}
	
	method necesitamant(){
		return aparatos.all({aparato=>not aparato.necesitaMant()})
	}
	method mitadAparatos(){
		return aparatos.size() / 2
	}
	
	method cantComplicado(){
		return aparatos.count({aparato=>aparato.necesitaMant()})
	}
	method estaComplicado(){
		return self.mitadAparatos() <= self.cantComplicado()
	}
	method visitaTecnico(){
		aparatos.forEach({aparato=>aparato.mantenimiento()})
	}
}
