package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException

class VentasController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ventasList: Ventas.list(params), ventasTotal: Ventas.count()]
    }

    def create() {
        [ventas: new Ventas(params)]
    }

    def save() {
        def ventas = new Ventas(params)
        Producto producto = ventas.producto
        if(producto.cantidad < ventas.cantidad){
            flash.message = message(code:"no tiene suficiente en almacen, maximo: " + producto.cantidad)
            render(view: "create", model: [ventas: ventas])
            return
        }
        producto.cantidad -= ventas.cantidad
        if (!ventas.save(flush: true)) {
            render(view: "create", model: [ventas: ventas])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ventas.label', default: 'Ventas'), ventas.id])
        redirect(action: "show", id: ventas.id)
    }

    def show(Long id) {
        def ventas = Ventas.get(id)
        if (!ventas) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        [ventas: ventas]
    }

    def edit(Long id) {
        def ventas = Ventas.get(id)
        if (!ventas) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        [ventas: ventas]
    }

    def update(Long id, Long version) {
        def ventas = Ventas.get(id)
        if (!ventas) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ventas.version > version) {
                ventas.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ventas.label', default: 'Ventas')] as Object[],
                          "Another user has updated this Ventas while you were editing")
                render(view: "edit", model: [ventas: ventas])
                return
            }
        }

        ventas.properties = params

        if (!ventas.save(flush: true)) {
            render(view: "edit", model: [ventas: ventas])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ventas.label', default: 'Ventas'), ventas.id])
        redirect(action: "show", id: ventas.id)
    }

    def delete(Long id) {
        def ventas = Ventas.get(id)
        if (!ventas) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        try {
            ventas.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "show", id: id)
        }
    }
}
