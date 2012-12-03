
<%@ page import="com.rubi.maniquies.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pedido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pedido">
			
				<g:if test="${pedido?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="pedido.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${pedido}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedido?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="pedido.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${pedido}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedido?.fechaEntrega}">
				<li class="fieldcontain">
					<span id="fechaEntrega-label" class="property-label"><g:message code="pedido.fechaEntrega.label" default="Fecha Entrega" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrega-label"><g:formatDate date="${pedido?.fechaEntrega}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedido?.fechaPedido}">
				<li class="fieldcontain">
					<span id="fechaPedido-label" class="property-label"><g:message code="pedido.fechaPedido.label" default="Fecha Pedido" /></span>
					
						<span class="property-value" aria-labelledby="fechaPedido-label"><g:formatDate date="${pedido?.fechaPedido}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedido?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="pedido.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${pedido?.producto?.id}">${pedido?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pedido?.id}" />
					<g:link class="edit" action="edit" id="${pedido?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
