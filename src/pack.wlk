import consumo.*

class Pack{

	var fechaVigencia
	
	method estaVigente() = fechaVigencia > new Date()
	
	method mismoTipoConsumoPack(unConsumo) = unConsumo.tipoConsumo() == self.tipoPack()
	
	method tipoPack() = ""
	
	// Punto 3
	method satisfaceConsumo(unConsumo) = self.mismoTipoConsumoPack(unConsumo) and self.criterio(unConsumo)

	method criterio(unConsumo) // Lo necesito polimorfico para cada tipo de paquete
}

class Credito inherits Pack {
    var creditoDisponible  
    
    method criterio(unConsumo) = creditoDisponible >= unConsumo.calcularCosto()

}

class MegasLibres inherits Pack{
    var mbLibres
    
   	method criterio(unConsumo) = mbLibres >= unConsumo.gastoRecurso()
  	
  	override method tipoPack() = "internet"
  	
}

class LlamadasGratis inherits Pack{
    var llamadasGratis

	override method tipoPack() = "llamadas"
   
   	method criterio(unConsumo) =  llamadasGratis >= unConsumo.gastoRecurso()
}

class InternetLibre inherits Pack{
    var finInternetLibre  
    
    override method tipoPack() = "internet"
    
    method criterio(unConsumo) =  finInternetLibre > 0 and self.estaVigente()
  	
}