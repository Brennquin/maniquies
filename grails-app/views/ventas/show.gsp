
<%@ page import="com.rubi.maniquies.Ventas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ventas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ventas" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ventas">
			
				<g:if test="${ventas?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="ventas.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${ventas}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="ventas.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${ventas?.cliente?.id}">${ventas?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.fechaVenta}">
				<li class="fieldcontain">
					<span id="fechaVenta-label" class="property-label"><g:message code="ventas.fechaVenta.label" default="Fecha Venta" /></span>
					
						<span class="property-value" aria-labelledby="fechaVenta-label"><g:formatDate date="${ventas?.fechaVenta}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="ventas.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${ventas}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="ventas.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${ventas?.producto?.id}">${ventas?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ventas?.id}" />
					<g:link class="edit" action="edit" id="${ventas?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
