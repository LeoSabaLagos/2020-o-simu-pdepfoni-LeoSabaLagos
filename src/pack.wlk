import consumo.*

class Pack{

	var fechaVigencia
	
	method estaVigente() = fechaVigencia > new Date()

    method estaVencido() = not(self.estaVigente())
	
	method mismoTipoConsumoPack(unConsumo) = unConsumo.tipoConsumo() == self.tipoPack()
	
	method tipoPack() = ""
	
	// Punto 3
	method satisfaceConsumo(unConsumo) = self.mismoTipoConsumoPack(unConsumo) and self.criterio(unConsumo)

	method criterio(unConsumo) // Lo necesito polimorfico para cada tipo de paquete

    method seLimpia() = self.estaVencido() or self.estaAcabado()

    method estaAcabado()
}

class Credito inherits Pack {
    var creditoDisponible  
    
    method criterio(unConsumo) = creditoDisponible >= unConsumo.calcularCosto()

    method consumir(cantidadConsumo) { creditoDisponible = (creditoDisponible - cantidadConsumo).max(0) }

    override method estaAcabado() = creditoDisponible == 0
}

class MegasLibres inherits Pack{
    var mbLibres
    
   	method criterio(unConsumo) = mbLibres >= unConsumo.gastoRecurso()
  	
  	override method tipoPack() = "internet"

    method consumirPack(cantidadConsumo) { mbLibres = (mbLibres - cantidadConsumo).max(0) }

    override  method estaAcabado() = mbLibres == 0
  	
}

class LlamadasGratis inherits Pack{
    var llamadasGratis

	override method tipoPack() = "llamadas"
   
   	method criterio(unConsumo) =  llamadasGratis >= unConsumo.gastoRecurso()

    method consumirPack(cantidadConsumo)

    override method estaAcabado() = llamadasGratis == 0
}

class InternetLibre inherits Pack{
    var finInternetLibre  
    
    override method tipoPack() = "internet"
    
    method criterio(unConsumo) =  finInternetLibre > 0 and self.estaVigente()

    method consumirPack(cantidadConsumo)

    override method estaAcabado() = false // Hace Identidad con el and en el metodo de la linea (Solo se limpia cuando no esta mas vigente)
}