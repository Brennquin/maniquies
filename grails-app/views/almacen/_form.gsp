<%@ page import="com.rubi.maniquies.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacen, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="almacen.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${almacen?.nombre}"/>
</div>

<g:javascript>
    jQuery(document).ready(function() {
       jQuery('#nombre').focus();
    });
</g:javascript>