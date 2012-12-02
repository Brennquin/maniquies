package com.rubi.maniquies

class Proveedor {
    String nombre
    Producto producto
    
    static hasMany = [Producto]

    static constraints = {
    }
    
    String toString(){
        return nombre
    }
}
