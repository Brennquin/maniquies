
<%@ page import="com.rubi.maniquies.Almacen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'almacen.label', default: 'Almacen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-almacen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" controller="almacen" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <li><g:link class="list" controller="almacen" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-almacen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'almacen.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'almacen.nombre.label', default: 'Productos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${almacenList}" status="i" var="almacen">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${almacen.id}">${fieldValue(bean: almacen, field: "nombre")}</g:link></td>
						<td><g:link action="productos" id="${almacen.id}">Lista de Productos</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${almacenTotal}" />
			</div>
		</div>
	</body>
</html>
