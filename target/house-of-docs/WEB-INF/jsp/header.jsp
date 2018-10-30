<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
	

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script> 
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

	<script type='text/javascript'>
		$( document ).ready(function() {
			$('#datetimepicker1').datetimepicker();
		});
	</script>
		
</head>

<body>
		<nav class="navbar navbar-inverse" style="margin:0">
		  <div class="container-fluid">
		  	<div class="row">
		  		<div class="col col-md-9">
					    <div class="navbar-header">
					      <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home of Docs</a>
					    </div>
					    <ul class="nav navbar-nav">
					      <security:authorize access="isAuthenticated()">
						      <li><a href="#">Raporty</a></li>
						      <li><a href="#">Słowniki</a></li>
						  </security:authorize>
					      <li><a href="${pageContext.request.contextPath}/dictionaries">O stronie</a></li>
					    </ul>
					    <security:authorize access="isAuthenticated()">
					   		<a href="${pageContext.request.contextPath}/search" class="btn btn-danger navbar-btn" role="button">Wyszukiwarka</a>
					    </security:authorize>
		    	</div>
		    	<div class="col col-md-3" >
			    	<security:authorize access="isAuthenticated()">
			    		<ul class="nav navbar-nav navbar-right" style="border-style: outset;
																	   border-color: #ff6666;
																	   border-width: 1px;
																	   border-radius: 10px">
				         <li><a><i class="glyphicon glyphicon-user"></i> <security:authentication property="principal.username"/></a></li>
				         <li class="dropdown">
				           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu  <span class="caret"></span></a>
				           <ul class="dropdown-menu">
				           	 <li><a href="#">Profil</a></li>
				             <li><a href="#">Historia</a></li>
				             <li role="separator" class="divider"></li>
				             <li><a><form:form action="${pageContext.request.contextPath}/logout" method="POST">
									<button type="submit" class="btn btn-danger">Wyloguj się</button>
								</form:form></a></li>
				           </ul>
				         </li>
				       </ul>
				     </security:authorize>
		    	</div>
		    </div>
		  </div>
		</nav>
<!-- NAVBAR -->

</body>
</html>