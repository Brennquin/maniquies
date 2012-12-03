
<%@ page import="com.rubi.maniquies.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
						
							<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
						
							<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
						
							<g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired')}" />
						
							<g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked')}" />
						
							<g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label', default: 'Enabled')}" />
						
							<g:sortableColumn property="passwordExpired" title="${message(code: 'usuario.passwordExpired.label', default: 'Password Expired')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${usuarioList}" var="usuario">
						<tr>
						
							<td>${fieldValue(bean: usuario, field: "username")}</td>
						
							<td>${fieldValue(bean: usuario, field: "password")}</td>
						
							<td><g:formatBoolean boolean="${usuario.accountExpired}" /></td>
						
							<td><g:formatBoolean boolean="${usuario.accountLocked}" /></td>
						
							<td><g:formatBoolean boolean="${usuario.enabled}" /></td>
						
							<td><g:formatBoolean boolean="${usuario.passwordExpired}" /></td>
						
							<td class="link">
								<g:link action="show" id="${usuario.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${usuarioTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
