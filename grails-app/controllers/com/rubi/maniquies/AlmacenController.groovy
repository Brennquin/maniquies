package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException

class AlmacenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [almacenList: Almacen.list(params), almacenTotal: Almacen.count()]
    }

    def create() {
        [almacen: new Almacen(params)]
    }

    def save() {
        def almacen = new Almacen(params)
        if (!almacen.save(flush: true)) {
            render(view: "create", model: [almacen: almacen])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacen.id])
        redirect(action: "show", id: almacen.id)
    }

    def show(Long id) {
        def almacen = Almacen.get(id)
        if (!almacen) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        [almacen: almacen]
    }

    def edit(Long id) {
        def almacen = Almacen.get(id)
        if (!almacen) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        [almacen: almacen]
    }

    def update(Long id, Long version) {
        def almacen = Almacen.get(id)
        if (!almacen) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (almacen.version > version) {
                almacen.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'almacen.label', default: 'Almacen')] as Object[],
                          "Another user has updated this Almacen while you were editing")
                render(view: "edit", model: [almacen: almacen])
                return
            }
        }

        almacen.properties = params

        if (!almacen.save(flush: true)) {
            render(view: "edit", model: [almacen: almacen])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacen.id])
        redirect(action: "show", id: almacen.id)
    }

    def delete(Long id) {
        def almacen = Almacen.get(id)
        if (!almacen) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        try {
            almacen.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def productos(Long id) {
        List productos = Producto.list(params)
        def prod = []
        for(Producto producto : productos){
            if(producto.almacen == Almacen.get(id)){
                prod << producto
            }
        }
        [productos: prod]
    }
}
