package com.rubi.maniquies

class Almacen {
    String nombre
    
    static constraints = {
        nombre blank: false, uniquie: true
    }
    
    String toString(){
        return nombre
    }
}
