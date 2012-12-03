
<%@ page import="com.rubi.maniquies.Ventas" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="cantidad" title="${message(code: 'ventas.cantidad.label', default: 'Cantidad')}" />
						
							<g:sortableColumn property="total" title="${message(code: 'ventas.total.label', default: 'Total')}" />
						
							<th class="header"><g:message code="ventas.cliente.label" default="Cliente" /></th>
						
							<g:sortableColumn property="fechaVenta" title="${message(code: 'ventas.fechaVenta.label', default: 'Fecha Venta')}" />
						
							<g:sortableColumn property="precio" title="${message(code: 'ventas.precio.label', default: 'Precio')}" />
						
							<th class="header"><g:message code="ventas.producto.label" default="Producto" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${ventasList}" var="ventas">
						<tr>
						
							<td>${fieldValue(bean: ventas, field: "cantidad")}</td>
						
							<td>${fieldValue(bean: ventas, field: "total")}</td>
						
							<td>${fieldValue(bean: ventas, field: "cliente")}</td>
						
							<td><g:formatDate date="${ventas.fechaVenta}" /></td>
						
							<td>${fieldValue(bean: ventas, field: "precio")}</td>
						
							<td>${fieldValue(bean: ventas, field: "producto")}</td>
						
							<td class="link">
								<g:link action="show" id="${ventas.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${ventasTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
