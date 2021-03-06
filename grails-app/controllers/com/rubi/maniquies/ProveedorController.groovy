package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class ProveedorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [proveedorList: Proveedor.list(params), proveedorTotal: Proveedor.count()]
    }

    def create() {
        [proveedor: new Proveedor(params)]
    }

    def save() {
        def proveedor = new Proveedor(params)
        if (!proveedor.save(flush: true)) {
            render(view: "create", model: [proveedor: proveedor])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), proveedor.id])
        redirect(action: "show", id: proveedor.id)
    }

    def show(Long id) {
        def proveedor = Proveedor.get(id)
        if (!proveedor) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), id])
            redirect(action: "list")
            return
        }

        [proveedor: proveedor]
    }

    def edit(Long id) {
        def proveedor = Proveedor.get(id)
        if (!proveedor) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), id])
            redirect(action: "list")
            return
        }

        [proveedor: proveedor]
    }

    def update(Long id, Long version) {
        def proveedor = Proveedor.get(id)
        if (!proveedor) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (proveedor.version > version) {
                proveedor.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'proveedor.label', default: 'Proveedor')] as Object[],
                          "Another user has updated this Proveedor while you were editing")
                render(view: "edit", model: [proveedor: proveedor])
                return
            }
        }

        proveedor.properties = params

        if (!proveedor.save(flush: true)) {
            render(view: "edit", model: [proveedor: proveedor])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), proveedor.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def proveedor = Proveedor.get(id)
        if (!proveedor) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), id])
            redirect(action: "list")
            return
        }

        try {
            proveedor.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'proveedor.label', default: 'Proveedor'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def productos(Long id) {
        List productos = Producto.list(params)
        def prod = []
        for(Producto producto : productos){
            if(producto.proveedor == Proveedor.get(id)){
                prod << producto
            }
        }
        [productos: prod]
    }
}
