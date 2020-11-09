import pack.*
import consumo.*

class Linea {
	var nroTelefono
	var packsActivos = []
	var consumosRealizados = []

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
}
