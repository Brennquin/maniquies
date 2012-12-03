
<%@ page import="com.rubi.maniquies.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-producto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list producto">
			
				<g:if test="${producto?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="producto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${producto}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="producto.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${producto}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="producto.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${producto}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.tamaño}">
				<li class="fieldcontain">
					<span id="tamaño-label" class="property-label"><g:message code="producto.tamaño.label" default="Tamaño" /></span>
					
						<span class="property-value" aria-labelledby="tamaño-label"><g:fieldValue bean="${producto}" field="tamaño"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="producto.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="almacen" action="show" id="${producto?.almacen?.id}">${producto?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.material}">
				<li class="fieldcontain">
					<span id="material-label" class="property-label"><g:message code="producto.material.label" default="Material" /></span>
					
						<span class="property-value" aria-labelledby="material-label"><g:fieldValue bean="${producto}" field="material"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="producto.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${producto}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${producto?.proveedor}">
				<li class="fieldcontain">
					<span id="proveedor-label" class="property-label"><g:message code="producto.proveedor.label" default="Proveedor" /></span>
					
						<span class="property-value" aria-labelledby="proveedor-label"><g:link controller="proveedor" action="show" id="${producto?.proveedor?.id}">${producto?.proveedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${producto?.id}" />
					<g:link class="edit" action="edit" id="${producto?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
