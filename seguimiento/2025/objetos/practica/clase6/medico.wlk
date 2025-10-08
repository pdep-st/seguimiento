import persona.*

class Medico inherits Persona {
    override method contraer(enfermedad) {
        super(enfermedad) // self.contraer(enfermedad) -> Con el method lookup alterado
        self.atender(self)
    }

    method atender(paciente)
}