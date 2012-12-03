<%@ page import="com.rubi.maniquies.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedor, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${proveedor?.nombre}"/>
</div>

