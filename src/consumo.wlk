import empresa.*

class Consumo {
    var fechaConsumo

    method fechaConsumo() = fechaConsumo
    
}

class ConsumoInternet inherits Consumo {
    var cantidadMB
    
    method tipoConsumo() = "internet"
	
    method calcularCosto(){
        // Se sabe que la empresa de telefonía dispone de un precio fijo
        // por cada MB consumido
        return cantidadMB * empresa.precioPorMB()
    }
    
    method gastoRecurso() = cantidadMB
}

class ConsumoLlamadas inherits Consumo {
    var cantidadSegundos
    
    method tipoConsumo() = "llamadas"

    method calcularCosto(){
        // se sabe que siempre se cobra un precio fijo por los primeros 30 
        //segundos de llamada y luego se cobra por segundo pasado de los 30.

        return empresa.precioFijoSegundos() + (cantidadSegundos - 30) * empresa.precioPorSegundo()
    }
    
    method gastoRecurso() = cantidadSegundos
        
}