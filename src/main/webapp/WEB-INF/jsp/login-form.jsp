<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">

<head>
	
	<title>Home of Docs - Logowanie</title>
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
					<div id="loginbox" style="margin-top: 10%; margin-bottom: 15%"
						class="mainbox col-md-3col-md-offset-2  col-sm-6 col-sm-offset-3">
						
						<div class="panel panel-danger">
			
							<div class="panel-heading">
								<div class="panel-title">Zaloguj się</div>
							</div>
			
							<div style="padding-top: 30px" class="panel-body">
			
								<!-- Login Form -->
								<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST" class="form-horizontal">
			
								    <!-- Place for messages: error, alert etc ... -->
								    <div class="form-group">
								        <div class="col-xs-15">
								            <div>
												
												<c:if test="${param.error != null}">	            
													<div class="alert alert-danger col-xs-offset-1 col-xs-10">
														Nieprawidłowy login lub hasło
													</div>
												</c:if>
												
												<c:if test="${param.logout != null}">		            
													<div class="alert alert-success col-xs-offset-1 col-xs-10">
														Zostałeś wylogowany
													</div>
											    </c:if>
											    
												<c:if test="${param.successRegistration != null}">		            
													<div class="alert alert-success col-xs-offset-1 col-xs-10">
														Zostałeś zarejestrowany do serwisu.<br> Możesz się zalogować swoimi danymi.
													</div>
											    </c:if>
								            </div>
								        </div>
								    </div>
			
									<!-- User name -->
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
										
										<input type="text" name="username" placeholder="nazwa użytkownika" class="form-control">
									</div>
			
									<!-- Password -->
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
										
										<input type="password" name="password" placeholder="hasło" class="form-control" >
									</div>
			
									<!-- Login/Submit Button -->
									<div style="margin-top: 10px" class="form-group">						
										<div class="col-sm-6 controls">
											<button type="submit" class="btn btn-danger">Zaloguj się</button>
										</div>
									</div>
			
								</form:form>
								<a href="${pageContext.request.contextPath}/register" class="forgot-password">
			                		Nie masz konta? Zarejestruj się.
			            		</a>
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