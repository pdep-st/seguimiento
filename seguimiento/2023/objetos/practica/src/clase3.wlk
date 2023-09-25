/*
 * Iña se cansó de su vida de programador y decidió salir a pasear
 * con su perra Mini y se dio cuenta que cada vez que salían, disminuía
 * su energía en una cantidad fija de 10.
 * Modelar a Iña que sale a pasear con Mini.
 */
 
 object inia {
 	const mascotas = [mini, mia]
 	
 	method pasear(kms) {
 		mascotas.forEach{mascota => mascota.pasear(kms)}
 	}
 	
 	method pasear() {
 		self.pasear(2)
 	}
 }
 
 object mini {
 	var property energia = 0
 	
 	method pasear(kms) {
 		self.disminuirEnergia(10)
 	}
 	
 	method disminuirEnergia(cantidad) {
 		energia = (energia - cantidad).max(0)
 	}

 }
 
 // TDD: Test Driven Development
 
 
 /*
 * Con el tiempo, Iña sumó a su gata Mía a sus paseos. De manera
 * similar a Mini, su gata perdía energía, pero era 5
 * por cada kilómetro que recorrían.
 * Modelar este nuevo requerimiento.
 */
 
 object mia {
 	var property energia = 0
 	
 	method pasear(kms) {
 		self.disminuirEnergia(5 * kms)
 	}
 	
 	method disminuirEnergia(cantidad) {
 		energia = (energia - cantidad).max(0)
 	}
 }
 
 
 
 
 
 
 
 
 /*
 * Iña se dio cuenta que era un negocio rentable pasear mascotas
 * por lo que empezó a pasear mascotas de sus vecinos.
 * Se dio cuenta que todos los gatos se comportaban igual, mientras que
 * los perros eran todos iguales excepto los golden, que gastan el doble
 * que los otros perros.
 * Modelar este nuevo requerimiento.
 */