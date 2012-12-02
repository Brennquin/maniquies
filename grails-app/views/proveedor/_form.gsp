<%@ page import="com.rubi.maniquies.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedor, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${proveedor?.nombre}"/>
</div>

