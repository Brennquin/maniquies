<%@ page import="com.rubi.maniquies.Rol" %>



<div class="fieldcontain ${hasErrors(bean: rol, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="rol.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authority" required="" value="${rol?.authority}"/>
</div>

