<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="initial-scale = 1.0">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  <r:require modules="scaffolding"/>

  <!-- Le fav and touch icons -->
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
  <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
  <link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
  <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">

  <g:layoutHead/>
  <r:layoutResources/>
</head>

<body>

  <nav class="navbar navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container-fluid">

        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>

        <a class="brand" href="${createLink(uri: '/')}"> <h1>Maniquies <small>Santa Maria</small></h1> </a>
        <div id="status" type="left">
        <sec:ifLoggedIn>
          <sec:loggedInUserInfo field="username" />[ ^_^ ]
          <g:link class="list" controller="logout" >Salir</g:link>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
          <g:link class="list" controller="login" >Login</g:link>
        </sec:ifNotLoggedIn>
      </div> 

        <div class="nav-collapse">
          <ul class="nav">
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="almacen" action="list"><g:message code="default.list.label" args="["Almacen"]" /></g:link></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="proveedor" action="list"><g:message code="default.list.label" args="["Proveedor"]" /></g:link></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="producto" action="list"><g:message code="default.list.label" args="["Producto"]" /></g:link></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="pedido" action="list"><g:message code="default.list.label" args="["Pedido"]" /></g:link></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="ventas" action="list"><g:message code="default.list.label" args="["Ventas"]" /></g:link></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="cliente" action="list"><g:message code="default.list.label" args="["Cliente"]" /></g:link></li>
            <li <%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><g:link class="list" controller="usuario" action="list"><g:message code="default.list.label" args="["Usuarios"]" /></g:link></li>
          <li>
            </li>
            <!--  
                                                                      <li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                                                          <li<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
</g:each>-->
          </ul>
        </div>
      </div>
      
    </div>
  </nav>

  <div class="container-fluid">
    <g:layoutBody/>

    <hr>

    <footer>
      <p>&copy; Company 2012</p>
    </footer>
  </div>

<r:layoutResources/>

</body>
</html>