<%@ page import="com.rubi.maniquies.Ventas" %>



<div class="fieldcontain ${hasErrors(bean: ventas, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="ventas.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" value="${fieldValue(bean: ventas, field: 'cantidad')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventas, field: 'total', 'error')} required">
	<label for="total">
		<g:message code="ventas.total.label" default="Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="total" value="${fieldValue(bean: ventas, field: 'total')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventas, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="ventas.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${com.rubi.maniquies.Cliente.list()}" optionKey="id" required="" value="${ventas?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventas, field: 'fechaVenta', 'error')} required">
	<label for="fechaVenta">
		<g:message code="ventas.fechaVenta.label" default="Fecha Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaVenta" precision="day"  value="${ventas?.fechaVenta}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ventas, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="ventas.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: ventas, field: 'precio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventas, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="ventas.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${com.rubi.maniquies.Producto.list()}" optionKey="id" required="" value="${ventas?.producto?.id}" class="many-to-one"/>
</div>

