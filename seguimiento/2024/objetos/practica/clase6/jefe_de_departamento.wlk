import medico.*

class JefeDeDepartamento inherits Medico {

    const property subordinados = #{}

    method agregarSubordinado(subordinado) {
        subordinados.add(subordinado)
    }

    override method atender(paciente) {
        if(!subordinados.isEmpty()){
            subordinados.anyOne().atender(paciente)
        }
    }
}