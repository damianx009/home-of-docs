<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Home of Docs - Wyszukiwarka</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/loader.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/fSelect.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/fMethods.css">
	    
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
	    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script> 
	    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
		<script src="${pageContext.request.contextPath}/scripts/fSelect.js"></script>
		<script src="${pageContext.request.contextPath}/scripts/fMethods.js"></script>
		
		<script type='text/javascript'>
			$( document ).ready(function() {
				$('#datetimepicker1').datetimepicker({
					 format: 'YYYY-MM-DD HH:mm'
				});
			});
		</script>
		
		<script type='text/javascript'>
			$( document ).ready(function() {
				$('#datetimepicker2').datetimepicker({
					format: 'YYYY-MM-DD HH:mm'
				});
			});
		</script>	
		<script type='text/javascript'>
		  function DisplayProgressMessage(ctl, msg) {
			  $("#loaderAnimation").removeClass("hidden");
			  $("#submit-serch-button").prop("disabled", true);
			  $("#submit-serch-button").text(msg);
			  return true;
		  }
		</script>
		<script type='text/javascript'>
			(function($) {
			    $(function() {
			        $('.source-systems').fSelect();
			    });
			})(jQuery);
		</script>
		<script type='text/javascript'>
			(function($) {
			    $(function() {
			        $('.distribution-methods').fMethods();
			    });
			})(jQuery);
		</script>
	</head>
	<body >
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
	
	<div class="view" >
		<div class="container">
			<div class="row">
				<div class="center-block">
					<div id="loginbox" style="margin-top: 2%"
						class="mainbox col-md-3col-md-offset-1  col-sm-10 col-sm-offset-1">
						
						<form:form action="${pageContext.request.contextPath}/getOutbounds" 
								   method="POST" 
								   class="form-horizontal" 
								   modelAttribute="searched-documents"
								   onsubmit="return DisplayProgressMessage(this, 'Wyszukiwanie...');">
						  <div class="form-row">
						    <div class="col-md-3 mb-3">      
						      <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-th-list"></i></span> 
						        <form:input path ="jobId" 
									        onkeypress='return event.charCode >= 48 && event.charCode <= 57' 
									        type="text" 
									        class="form-control"  
									        placeholder="Numer zadania CC"/>						      
						      </div>
						    </div>
						    <div class="col-md-3 mb-3">   
						     <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span> 
						        <form:input path ="barcode"  
									        onkeypress='return event.charCode >= 48 && event.charCode <= 57'  
									        type="text" 
									        class="form-control"  
									        placeholder="Barkod"/>						      
						      </div>
						    </div>
						    <div class="col-md-3 mb-3">
						      <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span> 
						        <form:input path ="policyNo" 
									        type="text" 
									        onkeypress='return event.charCode >= 48 && event.charCode <= 57' 
									        class="form-control"  
									        placeholder="Numer polisy"/>						      
						      </div>
						  	</div>
						  	 <div class="col-md-3 mb-3">
							    <div class='input-group date' id='datetimepicker1'>
							    	<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span> 
				                   <form:input path ="processedDateFrom" 
							                   type='text' 
							                   class="form-control" 
							                   placeholder="Przetworzono od" />
			                  	</div>
			                </div>
						  </div>
						  <div class="form-row">
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
						     	<div class='input-group'>
							    <span class="input-group-addon"><i class="glyphicon glyphicon-file"></i></span> 
				                   <form:input path ="documentId" type='text' class="form-control" placeholder="ID dokumentu"/>
			                  	</div>
						    </div>
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
			                   <div class='input-group'>
							       <span class="input-group-addon"><i class="glyphicon glyphicon-cog"></i></span> 
				                  	<form:select class="source-systems" multiple="true" path="sourceSystem">
									    <form:options items="${sourceSystems}" />
									</form:select>
			                  	</div>
						    </div>
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
						      	<div class='input-group'>
							       <span class="input-group-addon"><i class="glyphicon glyphicon-open-file"></i></span> 
				                   <form:select class="distribution-methods" multiple="true" path="distributionMethod">
									    <form:options items="${distributionMethods}" />
									</form:select>
			                  	</div>
						    </div>
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
							    <div class='input-group' id='datetimepicker2'>
							       <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span> 
				                   <form:input path ="processedDateTo" 
							                   type='text' 
							                   class="form-control" 
							                   placeholder="Przetworzono do"/>
			                  	</div>
			                </div>
						  </div>
		                  <div class="form-row" >
		                  	<div class="col-md-3 mb-3" style="margin-top: 25px">
		                  		<button 
		                  			class="btn btn-danger" 
		                  			type="submit"
		                  			id="submit-serch-button"
		                  		>Wyszukaj</button>
		                  	</div>
		                  </div>
		                   
						</form:form>
						
					</div>
				</div>
			</div>
		</div>
		<div class="container hidden"  id="loaderAnimation" >
			<div class="row">
				<div class="center-block">
					<div id="loginbox" style="margin-top: 2%; margin-bottom: 2%"
						class="mainbox col-sm-6 col-sm-offset-3">
						<div class="panel panel-danger">
							<div class="panel-heading">
								<div class="panel-title">Szukanie rezultatów...</div>
							</div>
							<div style="background-color: #ffffff;" class="panel-body">
								 <div class="form-row">
				                  	<div class="col-md-2">
				                  		<div class="spinner"></div>
				                  	</div>
				                  	<div class="col-md-6" style="margin-top: 2%; margin-left:3%;">
				                  		Proszę czekać...<br><br>Operacja może potrwać kilka minut...
				                  	</div>
				                 </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="center-block">
					<div id="loginbox" style="margin-top: 2%; margin-bottom: 10%"
						class="mainbox col-md-1col-md-offset-1  col-sm-10 col-sm-offset-1">
						<c:if test="${searchedDocumentsResult != null}">
							<div class="panel panel-danger">
								<div class="panel-heading">
									<div class="panel-title">Wyniki Wyszukiwania</div>
								</div>
								<div style="" class="panel-body">
								<table class="table table-hover">
								  <thead>
								    <tr>
								      <th scope="col">Zadanie CC</th>
								      <th scope="col">Barkod</th>
								      <th scope="col">ID dokumentu</th>
								      <th scope="col">Numer Polisy</th>
								      <th scope="col">System źródłowy</th>
								      <th scope="col">Metoda dystrybucji</th>
								      <th scope="col">Data wysyłki</th>
								    </tr>
								  </thead>
								  <tbody>
								    <c:forEach items="${searchedDocumentsResult}" var="document">
									    <tr>      
									        <td>${document.jobId}</td>
									        <td>${document.barcode}</td>
									        <td>${document.docTemplate}</td>
									        <td>${document.policyNo}</td>
									        <td>${document.sourceSystem}</td>
									        <td>${document.distributionMethod}</td>  
									        <td>${document.processedDate}</td>    
									    </tr>
									</c:forEach>
								  </tbody>
								</table>
									
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	</body>
</html>