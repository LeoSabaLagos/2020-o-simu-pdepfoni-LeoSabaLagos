class Pack{
  method disponibles() 
}

class Credito{
    var creditoDisponible
    
    override method disponibles() = creditoDisponible
}

class MegasLibres{
    var mbLibres

    override method disponibles() = mbLibres
}

class LlamadasGratis{
    var llamadasGratis

    override method disponibles() = llamadasGratis
}

class InternetLibre{
    var finInternetLibre

    override method disponibles() = finInternetLibre
}