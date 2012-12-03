
<%@ page import="com.rubi.maniquies.Ventas" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ventas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ventas" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ventas">
                          
                                <g:if test="${ventas?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="ventas.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label">${ventas?.producto?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="ventas.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${ventas}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.total}">
				<li class="fieldcontain">
					<span id="total-label" class="property-label"><g:message code="ventas.total.label" default="Total" /></span>
					
						<span class="property-value" aria-labelledby="total-label"><g:fieldValue bean="${ventas}" field="total"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventas?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="ventas.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label">${ventas?.cliente?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
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
			

			</ol>
			<g:form>
				<fieldset class="buttons">

					<g:hiddenField name="id" value="${ventas?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${ventas?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
