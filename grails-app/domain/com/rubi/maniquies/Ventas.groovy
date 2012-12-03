package com.rubi.maniquies

class Ventas {
    Producto producto
    Integer cantidad = new Integer(0)
    BigDecimal precio = new BigDecimal('0.0')
    Date fechaVenta = new Date()
    Cliente cliente

    static constraints = {
        cantidad min: 0
    }
    
    String toString(){
        return producto + "-" + cantidad
    }
}
