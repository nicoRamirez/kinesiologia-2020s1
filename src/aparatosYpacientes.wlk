import rutina.*
class Paciente{
	var property edad=0
	var property nivelForMusc=0
	var property nivelDolor=0
	var property rutina=null
	method nivelDolor(cant){
		nivelDolor=(self.nivelDolor()-cant).max(0)
	}
	method nivelForMusc(cant){
		nivelForMusc=self.nivelForMusc()+cant
	}
	method puedeUsar(maquina){
		return maquina.condicionesUso(self)
	}
	method hacerRutina(){
		rutina.sesionCompleta()
	}
}
class PacienteResist inherits Paciente{
	override method nivelForMusc(cant){
		super(cant) + rutina.cantRutina()
	}
}
class PacienteCapric inherits Paciente{
	override method puedeUsar(maquina){
		return super(maquina) and maquina.color() == rojo
	}
	override method hacerRutina(){
		super()
		rutina.sesionCompleta()
		rutina.usoEnRutina()
	}

}
class RapidaRecuperacion inherits Paciente{
	override method hacerRutina(){
		super()
		nivelDolor=3
	}
}
class Aparatos{
	var property color=blanco
	method disminuyeDolor(persona)
	method condicionesUso(persona)
	method mantenimiento()
	method necesitaMant()
	method uso()
}
class Magneto inherits Aparatos{
	var property imantacion=800
	override method disminuyeDolor(persona){
		persona.nivelDolor(persona.nivelDolor()*0.1)
	}
	override method mantenimiento(){
		imantacion=self.imantacion()+500
	}
	override method necesitaMant(){
		return self.imantacion()<100
	}
	override method uso(){
		imantacion= (self.imantacion() - 1).min(0)
	}
} 
class Bicicleta inherits Aparatos{
	var property cantdeVTornillo=0
	var property cantVpierAceit=0
	override method necesitaMant(){
		return self.cantdeVTornillo() >= 10 or self.cantVpierAceit()>=5
	}
	override method mantenimiento(){
		cantVpierAceit=0
		cantdeVTornillo=0
	}
	override method uso(){
		if(persona.nivelDolor()>30){
			cantdeVTornillo+=1
		}
		if(persona.edad().between(30,50)){
			cantVpierAceit+=1
		}
	}
	override method disminuyeDolor(persona){
		if(persona.puedeUsar(self)){
			persona.nivelDolor(4)
			persona.nivelForMusc(3)
		}
	}
	override method condicionesUso(persona){
		return persona.edad()>8
	}
}
class MiniTramp inherits Aparatos{
	override method disminuyeDolor(persona){
		if(persona.puedeUsar(self)){
			persona.nivelForMusc(persona.edad()*0.1)
		}
	}
	override method condicionesUso(persona){
		return persona.nivelDolor()<20
	}
}
object rojo{}
object blanco{}
object verde{}