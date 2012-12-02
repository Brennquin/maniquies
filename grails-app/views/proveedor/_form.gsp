<%@ page import="com.rubi.maniquies.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedor, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${proveedor?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedor, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="proveedor.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${com.rubi.maniquies.Producto.list()}" optionKey="id" required="" value="${proveedor?.producto?.id}" class="many-to-one"/>
</div>

