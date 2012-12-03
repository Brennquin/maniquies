package com.rubi.maniquies

class Producto {

    String nombre
    String material
    String color
    String tamaño
    BigDecimal precio
    Integer cantidad = new Integer('0')
    Almacen almacen
    Proveedor proveedor
        
    static constraints = {
        nombre blank: false
        cantidad min: 0
        color inList: ["Beige", "Moreno", "Cafe", "Blanco", "Transparente"]
        tamaño inList: ["Chico", "Mediano" , "Grande"]
    }
    
    
}
