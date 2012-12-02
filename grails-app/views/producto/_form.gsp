<%@ page import="com.rubi.maniquies.Producto" %>



<div class="fieldcontain ${hasErrors(bean: producto, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="producto.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" min="0" value="${producto.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: producto, field: 'color', 'error')} ">
	<label for="color">
		<g:message code="producto.color.label" default="Color" />
		
	</label>
	<g:select name="color" from="${producto.constraints.color.inList}" value="${producto?.color}" valueMessagePrefix="producto.color" />
</div>

<div class="fieldcontain ${hasErrors(bean: producto, field: 'tamaño', 'error')} ">
	<label for="tamaño">
		<g:message code="producto.tamaño.label" default="Tamaño" />
		
	</label>
	<g:select name="tamaño" from="${producto.constraints.tamaño.inList}" value="${producto?.tamaño}" valueMessagePrefix="producto.tamaño" />
</div>

<div class="fieldcontain ${hasErrors(bean: producto, field: 'almacen', 'error')} required">
	<label for="almacen">
		<g:message code="producto.almacen.label" default="Almacen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="almacen" name="almacen.id" from="${com.rubi.maniquies.Almacen.list()}" optionKey="id" required="" value="${producto?.almacen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producto, field: 'material', 'error')} ">
	<label for="material">
		<g:message code="producto.material.label" default="Material" />
		
	</label>
	<g:textField name="material" value="${producto?.material}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producto, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${producto?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: producto, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="producto.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: producto, field: 'precio')}" required=""/>
</div>

