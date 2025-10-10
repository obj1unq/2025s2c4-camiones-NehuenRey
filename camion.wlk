import cosas.*

object camion {
	const property cosas = #{}
	var property pesoTotal = tara
	const property tara = 1000
	var property pesoLimite = 2500
	var property bultosCamion = 0
	 

	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)){
			throw new UserException (message = "No puedes cargar algo que ya se encuentra en el camion")
		}else{
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa){
		if (cosas.contains(unaCosa)){
			cosas.remove(unaCosa)
		} else{
			throw new UserException (message = "No puedes descargar algo que no se encuentra en el camion")
		}
		
	}

	method todoPesoPar() {
		return cosas.all({c => (((c.peso())%(2) ) == 0) })
	  
	}

	
	method hayAlgunoQuePesa(pesoBuscado){
		return cosas.any({ c => c.peso() == pesoBuscado })
		
	}

	method pesoTotal() {
		pesoTotal = tara
		cosas.forEach({n => pesoTotal = pesoTotal + n})
	  return{ pesoTotal}
	}

	method sePasaDePeso(){
		pesoTotal = tara
	cosas.forEach({n => pesoTotal = pesoTotal + n})
	  return pesoTotal >= pesoLimite
	}

	method hayAlgunoConPeligro(nivelPeligro){
		return cosas.find{ c => c.nivelPeligrosidad() == nivelPeligro } 
	}

	method cosasMasPeligrosas(cantPeligro){
		return{
			if (cosas.contains(cantPeligro)){
				cosas.filter{ c => c.nivelPeligrosidad() > cantPeligro.nivelPeligrosidad() }
			} else {
				cosas.filter{ c => c.nivelPeligrosidad() > cantPeligro }
			}
		}
	}

	method puedeCircularEn(rutaActual){
		return{
			not self.sePasaDePeso() && self.rutaSinPeligro(rutaActual)
		}
	}

	method rutaSinPeligro(rutaActual){
		(self.cosasMasPeligrosas( rutaActual.maxpeligrosidad())).isEmpty()
	}

	method pesoEntre(pesomin, pesomax){
		return{
			cosas.any({c => (c.peso() > pesomin) && (c.peso() < pesomax)})
		}
	}

	method masPesada(){
		return{
			(cosas.sortby{c1 , c2 => c1.peso() > c2.peso()}).head()
		}
	}

	method pesos(){
		return{
			cosas.map({c => c.peso()})
		}
	}
	
	method cantidadBultos() {
	  bultosCamion = 0
	  cosas.forEach({c => bultosCamion = bultosCamion + c.cantBultos()})
	  return{
		bultosCamion
	  }
	}

	method sufrirAcctidente(){
		cosas.forEach({c => c.reaccionarAccidente()})
	}

	method transportar(destino, camino){
		pesoLimite = destino.soporteDePeso()
		if (camino.cumpleRequerimientos(self)){
			cosas.forEach({c => destino.almacenar(c)})
			cosas.clear()
		} else{
			throw new UserException (message = "No puedes pasar por esta ruta")
		}
	}

}

object almacen{
	var property almacenaje =  #{}

	method almacenar(objeto){
		almacenaje.add(objeto)
	}
}

object ruta9 {
	const property maxpeligrosidad = 20
	const property soporteDePeso = 2500
	
	method cumpleRequerimientos(automovil){
		automovil.puedeCircularEn(self)
	}
}

object caminosVecinales {
	const property soporteDePeso = 2000
	
	method cumpleRequerimientos(automovil){
		automovil.pesoTotal() <= soporteDePeso
	}
}

class UserException inherits Exception { }