<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>${profileDescription.firstName} ${profileDescription.lastName} - Home of Docs</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/userProfile.css">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
	    
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
	    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script> 
	    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		<div class="container">
			<div class="row">
				<div class="center-block">
					<div id="loginbox" style="margin-top: 5%; margin-bottom: 5%"
						class="mainbox col-md-1col-md-offset-1  col-sm-10 col-sm-offset-1">
						<div class="panel panel-danger">
							<div class="panel-heading">
								<div class="panel-title">Profil Pracownika</div>
							</div>
							<div style="" class="panel-body">
								<div class="container">
									<div class="row">
										<div class="col-md-3" style="color:red">
										 	<img src="${pageContext.request.contextPath}/img/portfolio/${profileDescription.avatarImage}"
										 	     alt="Avatar"
										 	     class="avatar">
										</div>
										<div class="col-md-6" style="color:black">
											<div id="user-profile-2" class="user-profile">
												<div class="tabbable">
													<div class="tab-content no-border padding-0">
														<div id="home" class="tab-pane in active">
															<div class="row">
																<div class="col-xs-6 col-sm-6" style="width: 100%">
																	<h4 class="red">
																		<span class="middle"><b>${profileDescription.firstName} ${profileDescription.lastName}</b></span>
											
																		<span class="label label-purple arrowed-in-right">
																			<i class="ace-icon fa fa-circle smaller-80 align-middle"></i>
																			online
																		</span>
																	</h4>
																	<div class="profile-user-info">
																		<div class="profile-info-row">
																			<div class="profile-info-name"> Stanowisko </div>
																			<div class="profile-info-value"><span>${profileDescription.position}</span></div>
																		</div>
																		<div class="profile-info-row">
																			<div class="profile-info-name"> Grupa </div>
																			<div class="profile-info-value"><span>${profileDescription.filterType.description}</span></div>
																		</div>
																		<c:if test="${profileDescription.phoneNo != null}">
																			<div class="profile-info-row">
																				<div class="profile-info-name"> Nr tel </div>
																				<div class="profile-info-value"><span>${profileDescription.phoneNo}</span></div>
																			</div>
																		</c:if>
																		<c:if test="${profileDescription.email != null}">
																			<div class="profile-info-row">
																				<div class="profile-info-name"> E-mail </div>
																				<div class="profile-info-value"><span>${profileDescription.email}</span></div>
																			</div>	
																		</c:if>		
																	</div>
																</div><!-- /.col -->
															</div><!-- /.row -->
														</div><!-- /#home -->
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:if test="${profileDescription.skillDescription != null}">
										<div class="row">
											<div class="col-md-9">
											<div class="hr-sect">Umiejętności</div>
											 	${profileDescription.skillDescription}
											</div>
										</div>
									</c:if>
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