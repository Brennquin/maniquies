package com.rubi.maniquies

class Proveedor {
    String nombre
    
    static constraints = {
        nombre blank: false, unique: true
    }
    
    String toString(){
        return nombre
    }
}
