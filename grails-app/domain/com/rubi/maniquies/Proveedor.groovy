package com.rubi.maniquies

class Proveedor {
    String nombre
    
    static constraints = {
        nombre blank: false
    }
    
    String toString(){
        return nombre
    }
}
