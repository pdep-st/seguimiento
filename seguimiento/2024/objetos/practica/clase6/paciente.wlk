import enfermedad_infecciosa.*
import enfermedad_autoinmune.*

class Paciente {
    const enfermedades = #{}
    var celulas = 8000000
    var temperatura = 36

    method celulas() = celulas

    method destruirCelulas(cantidad) {
        celulas -= cantidad
    }

    method enfermarse(enfermedad) {
        enfermedades.add(enfermedad)
    }

    method pasarDias(cantidad) {
        cantidad.times { index =>
            enfermedades.forEach{enfermedad => enfermedad.causarEfecto(self)}
        }
    }

    method aumentarTemperatura(cantidad) {
        temperatura += cantidad
    }

    method congelar() {
        temperatura = 0
    }

    method tratar(dosis) {
        enfermedades.forEach{enfermedad => enfermedad.atenuar(self.celulasAAtenuar(dosis))}
    }

    method celulasAAtenuar(dosis) = dosis * 15

    method temperatura() = temperatura
}