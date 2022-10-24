import persona.*

class Medico inherits Persona{
	
	override method contraer(enfermedad) {
		super(enfermedad) // self.contraer(enfermedad) pero ignorá a Medico en el method lookup
		self.atender(self)
	}
	
	method atender(persona)
}
