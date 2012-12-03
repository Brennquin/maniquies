package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class ProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productoList: Producto.list(params), productoTotal: Producto.count()]
    }

    def create() {
        [producto: new Producto(params)]
    }

    def save() {
        def producto = new Producto(params)
        if (!producto.save(flush: true)) {
            render(view: "create", model: [producto: producto])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'producto.label', default: 'Producto'), producto.id])
        redirect(action: "show", id: producto.id)
    }

    def show(Long id) {
        def producto = Producto.get(id)
        if (!producto) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        [producto: producto]
    }

    def edit(Long id) {
        def producto = Producto.get(id)
        if (!producto) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        [producto: producto]
    }

    def update(Long id, Long version) {
        def producto = Producto.get(id)
        if (!producto) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (producto.version > version) {
                producto.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'producto.label', default: 'Producto')] as Object[],
                          "Another user has updated this Producto while you were editing")
                render(view: "edit", model: [producto: producto])
                return
            }
        }

        producto.properties = params

        if (!producto.save(flush: true)) {
            render(view: "edit", model: [producto: producto])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'producto.label', default: 'Producto'), producto.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def producto = Producto.get(id)
        if (!producto) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        try {
            producto.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "show", id: id)
        }
    }
}
