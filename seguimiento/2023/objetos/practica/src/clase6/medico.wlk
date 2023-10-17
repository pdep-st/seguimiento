import paciente.*

class Medico inherits Paciente{
	
	override method contraerEnfermedad(enfermedad) {
		super(enfermedad) // self.contraerEnfermedad(enfermedad) pero mirando desde mi padre
		self.atender(self)
	}
	
	method atender(paciente)
	
}
