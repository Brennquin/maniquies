package com.rubi.maniquies

class Producto {

    String nombre
    BigDecimal precio
    String material
    String color
    Integer cantidad
    String tamaño
        
    static constraints = {
    }
    
    String toString(){
        return nombre;
    }
}
