package com.rubi.maniquies

class Ventas {
    Producto producto
    BigDecimal cantidad = new BigDecimal('0')
    BigDecimal total = new BigDecimal('0')
    Date fechaVenta = new Date()
    Cliente cliente

    static constraints = {
        cantidad min: 0.0
        total min: 0.0, blank: true
    }
    
    String toString(){
        return producto + "-" + cantidad
    }
}
