
<%@ page import="com.rubi.maniquies.Producto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
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
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${producto?.nombre}">
						<dt><g:message code="producto.nombre.label" default="Nombre" /></dt>
						
							<dd><g:fieldValue bean="${producto}" field="nombre"/></dd>
						
					</g:if>
				
					<g:if test="${producto?.material}">
						<dt><g:message code="producto.material.label" default="Material" /></dt>
						
							<dd><g:fieldValue bean="${producto}" field="material"/></dd>
						
					</g:if>
				
					<g:if test="${producto?.cantidad}">
						<dt><g:message code="producto.cantidad.label" default="Cantidad" /></dt>
						
							<dd><g:fieldValue bean="${producto}" field="cantidad"/></dd>
						
					</g:if>
				
					<g:if test="${producto?.color}">
						<dt><g:message code="producto.color.label" default="Color" /></dt>
						
							<dd><g:fieldValue bean="${producto}" field="color"/></dd>
						
					</g:if>
				
					<g:if test="${producto?.tamaño}">
						<dt><g:message code="producto.tamaño.label" default="Tamaño" /></dt>
						
							<dd><g:fieldValue bean="${producto}" field="tamaño"/></dd>
						
					</g:if>
				
					<g:if test="${producto?.almacen}">
						<dt><g:message code="producto.almacen.label" default="Almacen" /></dt>
						
							<dd><g:link controller="almacen" action="show" id="${producto?.almacen?.id}">${producto?.almacen?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${producto?.precio}">
						<dt><g:message code="producto.precio.label" default="Precio" /></dt>
						
							<dd><g:fieldValue bean="${producto}" field="precio"/></dd>
						
					</g:if>
				
					<g:if test="${producto?.proveedor}">
						<dt><g:message code="producto.proveedor.label" default="Proveedor" /></dt>
						
							<dd><g:link controller="proveedor" action="show" id="${producto?.proveedor?.id}">${producto?.proveedor?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${producto?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${producto?.id}">
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
