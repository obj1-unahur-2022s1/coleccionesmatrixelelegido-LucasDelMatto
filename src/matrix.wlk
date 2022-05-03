object neo{
	var energia = 100
	
	method esElegido() = true
	
	method vitalidad() = energia * 0.1
	
	method saltar() {energia = energia/2}
}

object morfeo {
	var property vitalidad = 8
	var cansado = false
	
	method esElegido() = false
	
	method saltar(){
		cansado = not cansado
		vitalidad = 0.max(vitalidad-1)
	}
	
}

object trinity {
	const property vitalidad = 0
	
	method esElegido() = false
	
	method saltar(){}
}

object nave{
	var pasajeros = #{neo,morfeo,trinity}
	
	method cantidad() = pasajeros.size()
	
	method mayorVitalidad() = pasajeros.max({ p => p.vitalidad()})
	
	method equilibrada(){	
		var vitalidad = pasajeros.map({ p => p.vitalidad()})
		
		return (vitalidad.max()/2 < vitalidad.min())
	}
	
	method hayElegido() = pasajeros.filter({ p => p.esElegido()}) != #{}
	
	method choca(){
		pasajeros.forEach({ p => p.saltar() })
		pasajeros.clear()
	}
	
	method acelera(){
		pasajeros.forEach({ p =>
			if (not p.esElegido()){
				p.saltar()
			}
		})
	}
}