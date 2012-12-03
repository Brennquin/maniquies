<%@ page import="com.rubi.maniquies.UsuarioRol" %>



<div class="fieldcontain ${hasErrors(bean: usuarioRol, field: 'rol', 'error')} required">
	<label for="rol">
		<g:message code="usuarioRol.rol.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rol" name="rol.id" from="${com.rubi.maniquies.Rol.list()}" optionKey="id" required="" value="${usuarioRol?.rol?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioRol, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="usuarioRol.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.rubi.maniquies.Usuario.list()}" optionKey="id" required="" value="${usuarioRol?.usuario?.id}" class="many-to-one"/>
</div>

