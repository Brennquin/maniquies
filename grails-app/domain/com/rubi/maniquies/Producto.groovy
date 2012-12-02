package com.rubi.maniquies

class Producto {

    String nombre
    String material
    String color
    String tamaño
    BigDecimal precio
    Integer cantidad = new Integer('0')
    
    Almacen almacen
        
    static constraints = {
        color inList: ["Beige", "Moreno", "Cafe"]
        tamaño inList: ["Chico", "Mediano" , "Grande"]
    }
    
    String toString(){
        return nombre
    }
}
