
<%@ page import="com.rubi.maniquies.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
				
					<g:if test="${usuario?.username}">
						<dt><g:message code="usuario.username.label" default="Username" /></dt>
						
							<dd><g:fieldValue bean="${usuario}" field="username"/></dd>
						
					</g:if>
				
					<g:if test="${usuario?.password}">
						<dt><g:message code="usuario.password.label" default="Password" /></dt>
						
							<dd><g:fieldValue bean="${usuario}" field="password"/></dd>
						
					</g:if>
				
					<g:if test="${usuario?.accountExpired}">
						<dt><g:message code="usuario.accountExpired.label" default="Account Expired" /></dt>
						
							<dd><g:formatBoolean boolean="${usuario?.accountExpired}" /></dd>
						
					</g:if>
				
					<g:if test="${usuario?.accountLocked}">
						<dt><g:message code="usuario.accountLocked.label" default="Account Locked" /></dt>
						
							<dd><g:formatBoolean boolean="${usuario?.accountLocked}" /></dd>
						
					</g:if>
				
					<g:if test="${usuario?.enabled}">
						<dt><g:message code="usuario.enabled.label" default="Enabled" /></dt>
						
							<dd><g:formatBoolean boolean="${usuario?.enabled}" /></dd>
						
					</g:if>
				
					<g:if test="${usuario?.passwordExpired}">
						<dt><g:message code="usuario.passwordExpired.label" default="Password Expired" /></dt>
						
							<dd><g:formatBoolean boolean="${usuario?.passwordExpired}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${usuario?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${usuario?.id}">
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
