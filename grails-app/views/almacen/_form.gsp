<%@ page import="com.rubi.maniquies.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacen, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="almacen.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${almacen?.nombre}"/>
</div>

