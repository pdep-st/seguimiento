import medico.*

class JefeDeDepartamento inherits Medico{
    const subordinados = #{}

    override method atender(paciente) {
        subordinados.anyOne().atender(paciente)
    }
}
