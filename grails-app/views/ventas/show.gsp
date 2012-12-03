
<%@ page import="com.rubi.maniquies.Ventas" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${ventas?.cantidad}">
						<dt><g:message code="ventas.cantidad.label" default="Cantidad" /></dt>
						
							<dd><g:fieldValue bean="${ventas}" field="cantidad"/></dd>
						
					</g:if>
				
					<g:if test="${ventas?.total}">
						<dt><g:message code="ventas.total.label" default="Total" /></dt>
						
							<dd><g:fieldValue bean="${ventas}" field="total"/></dd>
						
					</g:if>
				
					<g:if test="${ventas?.cliente}">
						<dt><g:message code="ventas.cliente.label" default="Cliente" /></dt>
						
							<dd><g:link controller="cliente" action="show" id="${ventas?.cliente?.id}">${ventas?.cliente?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${ventas?.fechaVenta}">
						<dt><g:message code="ventas.fechaVenta.label" default="Fecha Venta" /></dt>
						
							<dd><g:formatDate date="${ventas?.fechaVenta}" /></dd>
						
					</g:if>
				
					<g:if test="${ventas?.precio}">
						<dt><g:message code="ventas.precio.label" default="Precio" /></dt>
						
							<dd><g:fieldValue bean="${ventas}" field="precio"/></dd>
						
					</g:if>
				
					<g:if test="${ventas?.producto}">
						<dt><g:message code="ventas.producto.label" default="Producto" /></dt>
						
							<dd><g:link controller="producto" action="show" id="${ventas?.producto?.id}">${ventas?.producto?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${ventas?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${ventas?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
