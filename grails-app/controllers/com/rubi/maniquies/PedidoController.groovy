package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class PedidoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pedidoList: Pedido.list(params), pedidoTotal: Pedido.count()]
    }

    def create() {
        [pedido: new Pedido(params)]
    }

    def save() {
        def pedido = new Pedido(params)
        if (!pedido.save(flush: true)) {
            render(view: "create", model: [pedido: pedido])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedido.id])
        redirect(action: "show", id: pedido.id)
    }

    def show(Long id) {
        def pedido = Pedido.get(id)
        if (!pedido) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), id])
            redirect(action: "list")
            return
        }

        [pedido: pedido]
    }

    def edit(Long id) {
        def pedido = Pedido.get(id)
        if (!pedido) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), id])
            redirect(action: "list")
            return
        }

        [pedido: pedido]
    }

    def update(Long id, Long version) {
        def pedido = Pedido.get(id)
        if (!pedido) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pedido.version > version) {
                pedido.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pedido.label', default: 'Pedido')] as Object[],
                          "Another user has updated this Pedido while you were editing")
                render(view: "edit", model: [pedido: pedido])
                return
            }
        }

        pedido.properties = params

        if (!pedido.save(flush: true)) {
            render(view: "edit", model: [pedido: pedido])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pedido.label', default: 'Pedido'), pedido.id])
        redirect(action: "show", id: pedido.id)
    }

    def delete(Long id) {
        def pedido = Pedido.get(id)
        if (!pedido) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pedido.label', default: 'Pedido'), id])
            redirect(action: "list")
            return
        }

        try {
            pedido.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pedido.label', default: 'Pedido'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pedido.label', default: 'Pedido'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def listaPedidos(){
        List pedidos = Pedido.list(params)
        def ped = []
        for(Pedido pedido : pedidos){
            if(pedido.status == "Pedido"){
                ped << pedido
            }
        }
        [pedidos: ped, pedidoTotal: Pedido.count()]
    }
    
    def listaEntregados(){
        List pedidos = Pedido.list(params)
        def ped = []
        for(Pedido pedido : pedidos){
            if(pedido.status == "Entregado"){
                ped << pedido
            }
        }
        [pedidos: ped, pedidoTotal: Pedido.count()]
    }
    
    def entregar(Long id){
        Pedido pedido = Pedido.get(id)
        Producto producto = pedido.producto
        producto.cantidad += pedido.cantidad
        pedido.status = "Entregado"
        
        redirect(action: "list")
    }
}
