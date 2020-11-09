import pack.*
import consumo.*

class Linea {
	var nroTelefono
	var packsActivos = []
	var consumosRealizados = []

	method packsActivos() = packsActivos
	method consumosRealizados() = consumosRealizados

	// Punto 4
	method agregarPack(unPack){ packsActivos.add(unPack) }

	method agregarConsumo(unConsumo){ consumosRealizados.add(unConsumo) }

	// Punto 2a)
	method costoPromedioEntre(fechaInicial,fechaFinal){

		var consumosDentroRango = self.consumosEntre(fechaInicial,fechaFinal)
		var cantConsumosDentroRango = consumosDentroRango.size()
		var costoTotalEntreFechas = self.costoTotalRango(consumosDentroRango)

		return costoTotalEntreFechas / cantConsumosDentroRango
		
	}
	
	method costoTotalUltimosTreintaDias(){
		var hoy = new Date()
		var consumosDentroRango = self.consumosEntre(hoy.minusDays(30),hoy)

		return self.costoTotalRango(consumosDentroRango)

	}

	method consumosEntre(fechaInicial,fechaFinal) = consumosRealizados.filter({consumo => consumo.fechaConsumo().between(fechaInicial,fechaFinal)})

	method costoTotalRango(listaConsumos) = listaConsumos.map({consumo => consumo.calcularCosto()}).sum()
	
	// Punto 5
	method puedeHacerConsumo(unConsumo) = packsActivos.any({pack => pack.satisfaceConsumo(unConsumo)})

	method noPuedeHacerConsumo(unConsumo) = not(self.puedeHacerConsumo(unConsumo))

	//Punto 6
	method realizarConsumo(unConsumo){
		if(self.noPuedeHacerConsumo(unConsumo))
			self.error("No se puede realizar el consumo")
		else{
			self.agregarConsumo(unConsumo)
			packsActivos.find({pack => pack.satisfaceConsumo(unConsumo)}).consumirPack(unConsumo.cantidadConsumo()) 
		}
	}
	
	// Punto 7
	method limpiezaPacks(){ packsActivos.removeAllSuchThat{pack => pack.seLimpia()} }

}
