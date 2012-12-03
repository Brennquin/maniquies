
<%@ page import="com.rubi.maniquies.Proveedor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'proveedor.label', default: 'Proveedor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-proveedor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-proveedor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list proveedor">
			
				<g:if test="${proveedor?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="proveedor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${proveedor}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${proveedor?.id}" />
					<g:link class="edit" action="edit" id="${proveedor?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                        <h1><g:message code="default.show.label" args="["Productos de Proveedor"]" /></h1>
                        <table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="cantidad" title="${message(code: 'producto.cantidad.label', default: 'Cantidad')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'producto.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="tamaño" title="${message(code: 'producto.tamaño.label', default: 'Tamaño')}" />
					
						<th><g:message code="producto.almacen.label" default="Almacen" /></th>
					
						<g:sortableColumn property="material" title="${message(code: 'producto.material.label', default: 'Material')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productos}" status="i" var="producto">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${producto.id}">${fieldValue(bean: producto, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: producto, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: producto, field: "color")}</td>
					
						<td>${fieldValue(bean: producto, field: "tamaño")}</td>
					
						<td>${fieldValue(bean: producto, field: "almacen")}</td>
					
						<td>${fieldValue(bean: producto, field: "material")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
