
<%@ page import="com.rubi.maniquies.Pedido" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
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
				
					<g:if test="${pedido?.cantidad}">
						<dt><g:message code="pedido.cantidad.label" default="Cantidad" /></dt>
						
							<dd><g:fieldValue bean="${pedido}" field="cantidad"/></dd>
						
					</g:if>
				
					<g:if test="${pedido?.fechaEntrega}">
						<dt><g:message code="pedido.fechaEntrega.label" default="Fecha Entrega" /></dt>
						
							<dd><g:formatDate date="${pedido?.fechaEntrega}" /></dd>
						
					</g:if>
				
					<g:if test="${pedido?.status}">
						<dt><g:message code="pedido.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${pedido}" field="status"/></dd>
						
					</g:if>
				
					<g:if test="${pedido?.fechaPedido}">
						<dt><g:message code="pedido.fechaPedido.label" default="Fecha Pedido" /></dt>
						
							<dd><g:formatDate date="${pedido?.fechaPedido}" /></dd>
						
					</g:if>
				
					<g:if test="${pedido?.producto}">
						<dt><g:message code="pedido.producto.label" default="Producto" /></dt>
						
							<dd><g:link controller="producto" action="show" id="${pedido?.producto?.id}">${pedido?.producto?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${pedido?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${pedido?.id}">
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
