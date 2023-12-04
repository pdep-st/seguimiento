// Artistas
class Artista {
	var groupies = 0
	
	method calidad() {
		return self.calidadEstilos() + self.calidadArtista()
	}
	
	method calidadEstilos() = self.estilos().size() * 5
	
	method estilos()
	method calidadArtista()
	
	method sumarGroupies(cantidad) {
		groupies += cantidad
	}
	
	method estaPegado() = return groupies > 20000
}

class Musico inherits Artista {
	var instrumento
	const property estilos = #{}
	
	method tieneEstilo(estilo) = estilos.contains(estilo)
	
	method aprenderEstilo(estilo) {
		estilos.add(estilo)
	}
	
	override method calidadArtista() {
		return instrumento.calidad()
	}
	
	
	method esVocalista() = instrumento == voz
}

object amplificadorMarshall {
	method potencia() = 7
}

class Instrumento {
	var calidadBase
	
	method calidad(musico) = calidadBase + self.calidadInstrumento(musico)
	
	method calidadInstrumento(musico)
}

class GuitarraElectrica inherits Instrumento(calidadBase=15){
	const amplificador
	
	override method calidadInstrumento(musico) = amplificador.potencia()
}

class GuitarraCriolla inherits Instrumento(calidadBase=10){
	var cuerdasSanas
	
	override method calidadInstrumento(musico) = cuerdasSanas
} 

class InstrumentoParaEstilo inherits Instrumento{
	method estiloNecesario()
	method extraPorEstilo()
	
	override method calidadInstrumento(musico) {
		if(musico.tieneEstilo(self.estiloNecesario())) {
			return self.extraPorEstilo()
		}
		return 0
	}
}

class Bajo inherits InstrumentoParaEstilo(calidadBase=5){
	var color
	
	override method estiloNecesario() = "metal"
	
	override method extraPorEstilo() {
		if (color == "rojo"){
			return 7
		} else {
			return 2
		}
	}
}

object bateria inherits InstrumentoParaEstilo(calidadBase=10){
	override method estiloNecesario() = "rock"
	override method extraPorEstilo() = 10
}


object voz inherits Instrumento(calidadBase=16){
	method cambiarCalidad(nuevaCalidad){
		calidadBase = nuevaCalidad
	}
	
	override method calidadInstrumento(musico) = 0
}


const taylor = new Musico(instrumento=voz, estilos=#{"pop", "rock", "country"})
const maikel = new Musico(instrumento=voz, estilos=#{"pop", "soul"})
const guitarraRiorio = new GuitarraElectrica(amplificador=amplificadorMarshall)
const riorio = new Musico(instrumento=guitarraRiorio, estilos=#{"metal", "heavy metal"})
const hellMusic = new Musico(instrumento=voz, estilos=#{"metal", "death metal"})
const truquillo = new Musico(instrumento=new Bajo(color="rojo"), estilos=#{"rock", "metal"})
const emiliaViernes = new Musico(instrumento=voz, estilos=#{"cumbia uruguaya", "pop"})
const rengoEstar = new Musico(instrumento=bateria, estilos=#{"rock", "pop"})


class Banda inherits Artista {
	const integrantes = #{}
	
	method agregarIntegrante(integrante) {
		self.validarNuevoIntegrante(integrante)
		integrantes.add(integrante)
	}
	
	method validarNuevoIntegrante(integrante) {
		if (!integrantes.isEmpty()) {
			self.validarUnSoloVocalista(integrante)
			self.validarComparteEstilo(integrante)
			self.validarCantidadIntegrantes()	
		}
	}
	
	method validarUnSoloVocalista(integrante) {
		if (integrante.esVocalista() && self.tenemosVocalista()) {
			self.error("Ya tenemos un vocalista!")
		}
	}
	
	method tenemosVocalista() = integrantes.any {integrante => integrante.esVocalista()}
	
	method validarComparteEstilo(integrante){
		if (not self.comparteEstilosConTodos(integrante)) {
			self.error("No tenemos un estilo en común")
		}
	}
	
	method comparteEstilosConTodos(integrante) {
		return self.estilos().any({estilo => integrante.tieneEstilo(estilo)})
	}
	
	override method estilos() {
		if (integrantes.isEmpty()) {
			return []
		}
		const estilos = integrantes.any().estilos()
		return integrantes.fold(
			estilos, {estilosEnComun, integrante => integrante.estilos().intersection(estilosEnComun)}
		)
	}
	
	method validarCantidadIntegrantes() {
		if (integrantes.size() >= 4) {
			self.error("Ya tenemos muchos integrantes, admitimos 4")
		}
	}
	
	override method calidadArtista() {
		return self.elMejor().calidad() + self.calidadIntegrantes()
	}
	
	method calidadIntegrantes() {
		return integrantes.size() * 2
	}
	
	method elMejor() {
		return integrantes.max {integrante => integrante.calidad()}
	}
	
	override method sumarGroupies(cantidad) {
		super(cantidad)
		self.elMejor().sumarGroupies(cantidad / 2)
	}
}

class Recital {
	const artista
	const duracion
	const participantes
	
	method ejecutar() {
		artista.sumarGroupies(self.porcentajeCaptado() * participantes)
	}
	
	method porcentajeCaptado() {
		return (artista.calidad() - self.perdidaPorDuracion()).min(100) / 100
	}
	
	method perdidaPorDuracion() {
		if (duracion < 60) {
			return 3
		}
		return 0
	}
}
