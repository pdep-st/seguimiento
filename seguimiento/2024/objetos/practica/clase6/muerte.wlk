import enfermedad.*

object muerte inherits Enfermedad(celulasAmenazadas=0) {

    override method atenuar(dosis) {
        "No hacer nada"
    }

    override method causarEfecto(paciente) {
        paciente.congelar()
    }

    override method esAgresiva(paciente) = true

}