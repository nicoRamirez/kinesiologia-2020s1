import aparatosYpacientes.*
class Rutina{
	var property rutinaAsignada=[]
	var property persona
	method agregarRutina(maquina){
		
		rutinaAsignada.add(maquina)
		
	}
	method puedeHacerRutina(){
		rutinaAsignada.all({maquina=>persona.puedeUsar(maquina)})
	}
	method sesionCompleta(){
		rutinaAsignada.forEach({maquina=>maquina.disminuyeDolor(persona)})
	}
	method cantRutina(){
		return rutinaAsignada.size()
	}
	method usoEnRutina(){
		rutinaAsignada.forEach({maquina=>maquina.uso(persona)})
	}
	
}
