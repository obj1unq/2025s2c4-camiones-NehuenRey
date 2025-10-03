object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var property peso = 100
	method nivelPeligrosidad() { return 1 }
}
object bumblebee {
	var property estaEnFormaRobot = true
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return{ if (estaEnFormaRobot) {
			30
		}
		else 15}}
}
object paqueteDeLadrillos {
	var property cantLadrillos = 100
	method peso() { return cantLadrillos*2 }
	method nivelPeligrosidad() { return 2 }
}
object bateríaAntiaérea {
	var property hayMisiles = true
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
	
	method nivelPeligrosidad() { return 200 }
}

