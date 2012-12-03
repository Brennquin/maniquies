
<%@ page import="com.rubi.maniquies.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="list" controller="pedido" action="list"><g:message code="default.list.label" args="["Pedido"]" /></g:link></li>
				<li><g:link class="create" action="listaEntregados"><g:message code="default.list.label" args="["Entregados"]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pedido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'pedido.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'pedido.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="fechaEntrega" title="${message(code: 'pedido.fechaEntrega.label', default: 'Fecha Entrega')}" />
					
						<g:sortableColumn property="fechaPedido" title="${message(code: 'pedido.fechaPedido.label', default: 'Fecha Pedido')}" />
					
						<th><g:message code="pedido.producto.label" default="Producto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pedidos}" status="i" var="pedido">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pedido.id}">${fieldValue(bean: pedido, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: pedido, field: "status")}</td>
					
						<td><g:formatDate date="${pedido.fechaEntrega}" /></td>
					
						<td><g:formatDate date="${pedido.fechaPedido}" /></td>
					
						<td>${fieldValue(bean: pedido, field: "producto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pedidoTotal}" />
			</div>
		</div>
	</body>
</html>
