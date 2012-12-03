package com.rubi.maniquies

class Pedido {
    Producto producto
    Integer cantidad = new Integer('0')
    Date fechaPedido = new Date()
    Date fechaEntrega = new Date()
    String status

    static constraints = {
        cantidad min: 0
        status inList: ["Pedido", "Entregado"]
    }
}
