class Consumo {
    var fechaConsumo
    
    method fechaConsumo() = fechaConsumo
}

class ConsumoInternet inherits Consumo {
    var cantidadMB
    var precioMb

    method calcularCosto(){
        // Se sabe que la empresa de telefonía dispone de un precio fijo
        // por cada MB consumido
        return cantidadMB * precioMb
    }
}

class ConsumoLlamadas inherits Consumo {
    var cantidadSegundos
    var precioSegundos
    var precioFijo

    method calcularCosto(){
        // se sabe que siempre se cobra un precio fijo por los primeros 30 
        //segundos de llamada y luego se cobra por segundo pasado de los 30.

        return precioFijo + (cantidadSegundos - 30) * precioSegundos
    }
}