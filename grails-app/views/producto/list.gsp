
<%@ page import="com.rubi.maniquies.Producto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="material" title="${message(code: 'producto.material.label', default: 'Material')}" />
						
							<g:sortableColumn property="cantidad" title="${message(code: 'producto.cantidad.label', default: 'Cantidad')}" />
						
							<g:sortableColumn property="color" title="${message(code: 'producto.color.label', default: 'Color')}" />
						
							<g:sortableColumn property="tamaño" title="${message(code: 'producto.tamaño.label', default: 'Tamaño')}" />
						
							<th class="header"><g:message code="producto.almacen.label" default="Almacen" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${productoList}" var="producto">
						<tr>
						
							<td>${fieldValue(bean: producto, field: "nombre")}</td>
						
							<td>${fieldValue(bean: producto, field: "material")}</td>
						
							<td>${fieldValue(bean: producto, field: "cantidad")}</td>
						
							<td>${fieldValue(bean: producto, field: "color")}</td>
						
							<td>${fieldValue(bean: producto, field: "tamaño")}</td>
						
							<td>${fieldValue(bean: producto, field: "almacen")}</td>
						
							<td class="link">
								<g:link action="show" id="${producto.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${productoTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
