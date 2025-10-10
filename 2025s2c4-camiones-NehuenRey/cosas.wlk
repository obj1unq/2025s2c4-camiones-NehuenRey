object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantBultos() {return 1}
	method reaccionarAccidente(){}
}

object arenaAGranel {
	var property peso = 100
	method nivelPeligrosidad() { return 1 }
	method cantBultos() {return 1}
	method reaccionarAccidente(){
		peso += 20
	}
}
object bumblebee {
	var property estaEnFormaRobot = true

	method peso() { return 800 }
	method cantBultos() {return 2}

	method reaccionarAccidente(){
		if (estaEnFormaRobot){
			estaEnFormaRobot = false
		}else{
			estaEnFormaRobot = true
		}
	}

	method cambiarForma(){
		 estaEnFormaRobot = not estaEnFormaRobot
	}

	method nivelPeligrosidad() { 
		return{ if (estaEnFormaRobot) {
			30
		}
		else 15}
	}
}
object paqueteDeLadrillos {
	var property cantLadrillos = 100
	var property cantBultos = self.bultos()

	method reaccionarAccidente(){
		if (cantLadrillos<=12){
			cantLadrillos = 0
		}else{
			cantLadrillos -= 12
		}
	}

	method bultos(){
		if (cantLadrillos<= 100){
			1
		}else{
			if (cantLadrillos<= 300){
				2
			}else{ 
				3
			}
		}	
	}
	method peso() { return cantLadrillos*2 }
	method nivelPeligrosidad() { return 2 }
}
object bateríaAntiaérea {
	var hayMisiles = true
	var property cantBultos = self.bultos()

	
	method reaccionarAccidente(){
		self.DescargarMisiles()
	}

	method bultos(){
		if (hayMisiles){
			2
		}else{
			1
		}	
	}

	method cargarMisiles(){
		hayMisiles = true
	}

	method DescargarMisiles(){
		hayMisiles = false
	}

	method peso() { 
		return { 
		if (hayMisiles) {
			300
		}
		else 200}} 

	method nivelPeligrosidad() { 
		return { 
		if (hayMisiles) {
			100
		}
		else 0} }
}
object residuosRadiactivos {
	var property peso = 50
	
	method reaccionarAccidente(){
		peso += 15
	}
	method cantBultos() {return 1}
	method nivelPeligrosidad() { return 200 }
}

object contenedorPortuario {
	var property peso = 100 + carga.forEach({ c => c.peso()})
	var property peligrosidad = self.peligrosidadMax()
	var property carga = #{}
	var property cantBultos = 1 + carga.forEach({ c => c.cantBultos()})

	method reaccionarAccidente(){
		carga.forEach({ c => c.reaccionarAccidente() })
	}

	method peligrosidadMax() {
		if (carga.isEmpty()) {
			0
		} else {
			carga.map({c => c.peso()}).max()
		}
	} 
}

object embalajeDeSeguridad {
	var property objeto = knightRider
	method cantBultos() {return 2}
	const property peso = objeto.peso()
	const property peligrosidad = 0.5*objeto.peligrosidad()
	method reaccionarAccidente(){} 

}

