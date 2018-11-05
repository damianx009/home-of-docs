<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">

<head>
	
	<title>Home of Docs - Rejestracja</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>



	<div class="view">
		<div class="container">
			<div class="row">
				<div class="center-block">
					<div id="registerbox" style="margin-top: 5%; margin-bottom: 5%"
						class="mainbox col-md-3col-md-offset-2  col-sm-6 col-sm-offset-3">
						
						<div class="panel panel-danger">
			
							<div class="panel-heading">
								<div class="panel-title">Formularz rejestracyjny</div>
							</div>
			
							<div style="padding-top: 30px" class="panel-body">
			
								<!-- Login Form -->
								<form:form action="${pageContext.request.contextPath}/processRegisterForm" method="POST" class="form-horizontal" modelAttribute="newUser">
									<!-- Login użytkownika -->
									<form:errors path="login" cssClass="alert alert-danger fade in" element="div"/>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
										<form:input path ="login" type="text" name="username" placeholder="Login użytkownika" class="form-control"/>
									</div>
										
									<!-- Hasło -->
									<form:errors path="" cssClass="alert alert-danger fade in" element="div"/>
									<form:errors path="password" cssClass="alert alert-danger fade in" element="div"/>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
										<form:input path ="password"  type="password" name="password" placeholder="Hasło" class="form-control" />
									</div>
										
									<!-- Potwierdz hasło -->
									<form:errors path="repeatPassword" cssClass="alert alert-danger fade in" element="div"/>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
										<form:input path ="repeatPassword"  type="password" name="password" placeholder="Potwierdź hasło" class="form-control" />
									</div>
										
									<!-- Email -->
									<form:errors path="email" cssClass="alert alert-danger fade in" element="div"/>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span> 
										<form:input path ="email"  type="text" name="password" placeholder="E-mail" class="form-control" />
									</div>
										
									<!-- Nr telefonu -->
									<form:errors path="phone" cssClass="alert alert-danger fade in" element="div"/>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span> 
										<form:input path ="phone" type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="password" placeholder="Numer telefonu" class="form-control" />
									</div>
									
									<!-- Wyślij formularz -->
									<div style="margin-top: 10px" class="form-group">						
										<div class="col-sm-6 controls">
											<button type="submit" class="btn btn-danger">Rejestruj</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>	
</body>
</html>