object dolar {

	method caro() {
		return true
	}

}

object lavarropaPhilips {
	
	method precio() {
		return 22000
	}
	
}

object notebookHP4129 {
	
	var precio = 28000
	
	method caro(producto) {
		return self.precio() > producto.precio()
	}
	
	method precio(unPrecio){
		precio = unPrecio
	}
	
	method precio() {
		return precio * 1.1
	}

	method precioSinIva(){
		return self.precio() / 1.21
	}

}
