<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>House of docs</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Reference Bootstrap files -->
		<link rel="stylesheet"
			 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
			 
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
		 <h1>Mega Firma</h1>
		<hr>
		<p>Udało się zalogować ! Strona w budowie</p>
		<hr>
		Siemanko <security:authentication property="principal.username"/>
		<br><br>
		Role: <security:authentication property="principal.authorities"/>
		
		<security:authorize access="hasRole('MANAGER')">
			<p><a href="${pageContext.request.contextPath}/leaders">Leadership meeting</a>(Only for menagers)</p>	
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
			<p><a href="${pageContext.request.contextPath}/systems">Administrator</a>(only when system is broken)</p>		
		</security:authorize>
		
		<hr>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="logout"/>
		</form:form>
		 
		 
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
</html>