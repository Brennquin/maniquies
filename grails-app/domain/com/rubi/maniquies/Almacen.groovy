package com.rubi.maniquies

class Almacen {
    String nombre
    
    static constraints = {
        nombre blank: false
    }
    
    String toString(){
        return nombre
    }
}
