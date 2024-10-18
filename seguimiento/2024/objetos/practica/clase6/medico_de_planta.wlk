import medico.*

class MedicoDePlanta inherits Medico {
    
    const dosis

    method atender(paciente) {
        paciente.tratar(dosis)
    }
}