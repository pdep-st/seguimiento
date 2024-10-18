import paciente.*

class Medico inherits Paciente {

    override method enfermarse(enfermedad) {
        super(enfermedad)
        self.atender(self)
    }

    method atender(paciente)

}