<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-inverse" style="margin:0; border-radius: 0px">
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
			      <li><a href="${pageContext.request.contextPath}/about">O stronie</a></li>
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