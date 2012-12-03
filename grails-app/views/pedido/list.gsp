
<%@ page import="com.rubi.maniquies.Pedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
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
						
							<g:sortableColumn property="cantidad" title="${message(code: 'pedido.cantidad.label', default: 'Cantidad')}" />
						
							<g:sortableColumn property="fechaEntrega" title="${message(code: 'pedido.fechaEntrega.label', default: 'Fecha Entrega')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'pedido.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="fechaPedido" title="${message(code: 'pedido.fechaPedido.label', default: 'Fecha Pedido')}" />
						
							<th class="header"><g:message code="pedido.producto.label" default="Producto" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${pedidoList}" var="pedido">
						<tr>
						
							<td>${fieldValue(bean: pedido, field: "cantidad")}</td>
						
							<td><g:formatDate date="${pedido.fechaEntrega}" /></td>
						
							<td>${fieldValue(bean: pedido, field: "status")}</td>
						
							<td><g:formatDate date="${pedido.fechaPedido}" /></td>
						
							<td>${fieldValue(bean: pedido, field: "producto")}</td>
						
							<td class="link">
								<g:link action="show" id="${pedido.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${pedidoTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
