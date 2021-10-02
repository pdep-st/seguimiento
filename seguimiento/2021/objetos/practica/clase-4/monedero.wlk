class Persona {
	var edad = 18
	const nombre
	const monedero = new Monedero()
	var gastosSemanales = 0
	
	method gastosSemanales() = gastosSemanales
	
	method ahorrar(monto){
		monedero.ahorrar(monto)
	}
	
	method gastar(monto) {
		monedero.gastar(monto)
		gastosSemanales += 1
	}
	
	method saldo() = monedero.saldo()
	
}

class Monedero {
	var saldo = 0
	
	method saldo() = saldo
	method ahorrar(incremento) {
		saldo = saldo + incremento 
	}
	
	method gastar(decremento) {
		if (decremento < 0)
			self.error("no se puede descontar numeros negativos")
		if (saldo < decremento)
			self.error("no podes sacar mas plata de la que tenes")
			//throw new Exception(message = "no podes sacar mas plata de la que tenes")
		
		saldo = saldo - decremento
	}
}