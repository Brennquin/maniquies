
<%@ page import="com.rubi.maniquies.Ventas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ventas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ventas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'ventas.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="total" title="${message(code: 'ventas.total.label', default: 'Total')}" />
					
						<th><g:message code="ventas.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="fechaVenta" title="${message(code: 'ventas.fechaVenta.label', default: 'Fecha Venta')}" />
					
						<th><g:message code="ventas.producto.label" default="Producto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ventasList}" status="i" var="ventas">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ventas.id}">${fieldValue(bean: ventas, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: ventas, field: "total")}</td>
					
						<td>${fieldValue(bean: ventas, field: "cliente")}</td>
					
						<td><g:formatDate date="${ventas.fechaVenta}" /></td>
					
						<td>${fieldValue(bean: ventas, field: "producto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ventasTotal}" />
			</div>
		</div>
	</body>
</html>
