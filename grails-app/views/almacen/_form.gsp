<%@ page import="com.rubi.maniquies.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacen, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="almacen.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${almacen.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: almacen, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="almacen.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${com.rubi.maniquies.Producto.list()}" optionKey="id" required="" value="${almacen?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: almacen, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="almacen.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${com.rubi.maniquies.Proveedor.list()}" optionKey="id" required="" value="${almacen?.proveedor?.id}" class="many-to-one"/>
</div>

