<%@ page import="com.rubi.maniquies.Pedido" %>



<div class="fieldcontain ${hasErrors(bean: pedido, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="pedido.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" min="0" value="${pedido.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pedido, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="pedido.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${pedido.constraints.status.inList}" value="${pedido?.status}" valueMessagePrefix="pedido.status" />
</div>

<div class="fieldcontain ${hasErrors(bean: pedido, field: 'fechaEntrega', 'error')} required">
	<label for="fechaEntrega">
		<g:message code="pedido.fechaEntrega.label" default="Fecha Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaEntrega" precision="day"  value="${pedido?.fechaEntrega}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pedido, field: 'fechaPedido', 'error')} required">
	<label for="fechaPedido">
		<g:message code="pedido.fechaPedido.label" default="Fecha Pedido" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPedido" precision="day"  value="${pedido?.fechaPedido}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pedido, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="pedido.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${com.rubi.maniquies.Producto.list()}" optionKey="id" required="" value="${pedido?.producto?.id}" class="many-to-one"/>
</div>

