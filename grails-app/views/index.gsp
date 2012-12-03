<!doctype html>
<html>
	<head>
        <title><g:message code="general.inicio" /></title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main"/>
	</head>
	<body>
	    <div class="nav">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" controller="almacen" action="list"><g:message code="default.list.label" args="["Almacen"]" /></g:link></li>
                <li><g:link class="list" controller="proveedor" action="list"><g:message code="default.list.label" args="["Proveedor"]" /></g:link></li>
                <li><g:link class="list" controller="producto" action="list"><g:message code="default.list.label" args="["Producto"]" /></g:link></li>
            </ul>
        </div>
        <div class="body">
            <h1>Sistema</h1>
            <div id="text-body">
                <p>Bienvenido al Sistema</p>
            </div>
        </div>
    </body>
</html>