package com.rubi.maniquies

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioList: Usuario.list(params), usuarioTotal: Usuario.count()]
    }

    def create() {
        [usuario: new Usuario(params)]
    }

    def save() {
        def usuario = new Usuario(params)
        if (!usuario.save(flush: true)) {
            render(view: "create", model: [usuario: usuario])
            return
        }
        def rol = Rol.findByAuthority('ROLE_ADMIN')
        UsuarioRol.create(usuario, rol, false)

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "show", id: usuario.id)
    }

    def show(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        [usuario: usuario]
    }

    def edit(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        [usuario: usuario]
    }

    def update(Long id, Long version) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usuario.version > version) {
                usuario.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "edit", model: [usuario: usuario])
                return
            }
        }

        usuario.properties = params

        if (!usuario.save(flush: true)) {
            render(view: "edit", model: [usuario: usuario])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "show", id: usuario.id)
    }

    def delete(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        try {
            usuario.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "show", id: id)
        }
    }
}
