<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Wyszukiwarka dokumentów</title>
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
	<script type='text/javascript'>
		$( document ).ready(function() {
			$('#datetimepicker2').datetimepicker();
		});
	</script>		
	</head>
	<body>
	<%@ include file="/WEB-INF/jsp/header.jsp" %>
	
	<div class="view" style="background-image: url('http://www.lendr.com.ph/wp-content/uploads/2016/07/iStock_86602055_MEDIUM.jpg');
							 background-repeat: no-repeat;
							 background-size: cover;
							 background-position: center center;">
		<div class="container">
			<div class="row">
				<div class="center-block">
					<div id="loginbox" style="margin-top: 2%"
						class="mainbox col-md-3col-md-offset-1  col-sm-10 col-sm-offset-1">
						
						<form>
						  <div class="form-row">
						    <div class="col-md-3 mb-3">      
						      <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-th-list"></i></span> 
						        <input type="text" class="form-control"  placeholder="Numer zadania CC">						      
						      </div>
						    </div>
						    <div class="col-md-3 mb-3">   
						     <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span> 
						        <input type="text" class="form-control"  placeholder="Barkod">						      
						      </div>
						    </div>
						    <div class="col-md-3 mb-3">
						      <div class="input-group">
						        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span> 
						        <input type="text" class="form-control"  placeholder="Numer polisy">						      
						      </div>
						  	</div>
						  	 <div class="col-md-3 mb-3">
							    <div class='input-group date' id='datetimepicker1'>
							    	<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span> 
				                   <input type='text' class="form-control" placeholder="Przetworzono od" />
			                  	</div>
			                </div>
						  </div>
						  <div class="form-row">
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
						     	<div class='input-group date' id='datetimepicker1'>
							    <span class="input-group-addon"><i class="glyphicon glyphicon-file"></i></span> 
				                   <input type='text' class="form-control" placeholder="ID dokumentu"/>
			                  	</div>
						    </div>
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
						      	<div class='input-group date' id='datetimepicker1'>
							       <span class="input-group-addon"><i class="glyphicon glyphicon-cog"></i></span> 
				                   <input type='text' class="form-control" placeholder="System źródłowy"/>
			                  	</div>
						    </div>
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
						      	<div class='input-group date' id='datetimepicker1'>
							       <span class="input-group-addon"><i class="glyphicon glyphicon-open-file"></i></span> 
				                   <input type='text' class="form-control" placeholder="Metoda dystrybucji"/>
			                  	</div>
						    </div>
						    <div class="col-md-3 mb-3"  style="margin-top: 25px">
							    <div class='input-group date' id='datetimepicker2'>
							       <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span> 
				                   <input type='text' class="form-control" placeholder="Przetworzono do"/>
			                  	</div>
			                </div>
						  </div>
		                  <div class="form-row" >
		                  	<div class="col-md-3 mb-3" style="margin-top: 25px">
		                  		<button class="btn btn-danger" type="submit">Wyszukaj</button>
		                  	</div>
		                  </div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="center-block">
					<div id="loginbox" style="margin-top: 2%; margin-bottom: 35%"
						class="mainbox col-md-1col-md-offset-1  col-sm-10 col-sm-offset-1">
						
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
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    <tr>
							      <th scope="row">12341</th>
							      <td >123456789009</td>
							      <td>AKTYWACJA_MyA</td>
							      <td>42746329842</td>
							      <td>STRL</td>
							      <td>drukarnia</td>
							      <td>2018-01-01+01:00</td>
							    </tr>
							    
							  </tbody>
							</table>
								
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