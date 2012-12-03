package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class ClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [clienteList: Cliente.list(params), clienteTotal: Cliente.count()]
    }

    def create() {
        [cliente: new Cliente(params)]
    }

    def save() {
        def cliente = new Cliente(params)
        if (!cliente.save(flush: true)) {
            render(view: "create", model: [cliente: cliente])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
        redirect(action: "show", id: cliente.id)
    }

    def show(Long id) {
        def cliente = Cliente.get(id)
        if (!cliente) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        [cliente: cliente]
    }

    def edit(Long id) {
        def cliente = Cliente.get(id)
        if (!cliente) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        [cliente: cliente]
    }

    def update(Long id, Long version) {
        def cliente = Cliente.get(id)
        if (!cliente) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cliente.version > version) {
                cliente.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cliente.label', default: 'Cliente')] as Object[],
                          "Another user has updated this Cliente while you were editing")
                render(view: "edit", model: [cliente: cliente])
                return
            }
        }

        cliente.properties = params

        if (!cliente.save(flush: true)) {
            render(view: "edit", model: [cliente: cliente])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def cliente = Cliente.get(id)
        if (!cliente) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
            return
        }

        try {
            cliente.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), id])
            redirect(action: "show", id: id)
        }
    }
}
