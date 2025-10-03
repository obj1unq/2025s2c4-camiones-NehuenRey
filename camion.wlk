import cosas.*

object camion {
	const property cosas = #{}
	var property pesoTotal = tara
	const property conPesoPar = cosas.all { c => (c.peso()%2 ) == 0 }
	const property tara = 1000
	const property pesoLimite = 2500
	 

	method cargar(unaCosa) {
		if (not cosas.contains(unaCosa)){
			cosas.add(unaCosa)
		}
	}

	method descargar(unaCosa){
		if (cosas.contains(unaCosa)){
			cosas.remove(unaCosa)
		}
		
	}

	method todoPesoPar() {
		return conPesoPar.size() == cosas.size()
	  
	}

	method hayAlgunoQuePesa(pesoBuscado){
		return {
			cosas.any{ c => c.peso() == pesoBuscado }
		}
	}

	method pesoTotal() {
	pesoTotal = tara
	cosas.forEach({n => pesoTotal = pesoTotal + n})
	  return pesoTotal
	}

	method sePasaDePeso(){
		pesoTotal = tara
	cosas.forEach({n => pesoTotal = pesoTotal + n})
	  return pesoTotal >= pesoLimite
	}

	method hayAlgunoConPeligro(nivelPeligro){
		return {
			cosas.any{ c => c.nivelPeligrosidad() == nivelPeligro }
		}
	}

	method cosasMasPeligrosas(cantPeligro){
		return{
			if (cosas.contains(cantPeligro)){
				cosas.any{ c => c.nivelPeligrosidad() > cantPeligro.nivelPeligrosidad() }
			} else {
				cosas.any{ c => c.nivelPeligrosidad() > cantPeligro }
			}
		}
	}

}


