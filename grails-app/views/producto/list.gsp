
<%@ page import="com.rubi.maniquies.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-producto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'producto.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'producto.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="tamaño" title="${message(code: 'producto.tamaño.label', default: 'Tamaño')}" />
					
						<th><g:message code="producto.almacen.label" default="Almacen" /></th>
					
						<g:sortableColumn property="material" title="${message(code: 'producto.material.label', default: 'Material')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productoList}" status="i" var="producto">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${producto.id}">${fieldValue(bean: producto, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: producto, field: "color")}</td>
					
						<td>${fieldValue(bean: producto, field: "tamaño")}</td>
					
						<td>${fieldValue(bean: producto, field: "almacen")}</td>
					
						<td>${fieldValue(bean: producto, field: "material")}</td>
					
						<td>${fieldValue(bean: producto, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productoTotal}" />
			</div>
		</div>
	</body>
</html>