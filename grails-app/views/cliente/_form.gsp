<%@ page import="com.rubi.maniquies.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: cliente, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${cliente?.nombre}"/>
</div>

