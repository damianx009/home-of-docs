<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
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

	<footer>
	    <div class="footer navbar-fixed-bottom" style="background-color:#0d0d0d;color:#808080">
		    <div class="container">
		      <div class="row">
		        <div class="col-md-7">
		            <div class="row py-1">
			           <div class="col-sm-11 text-white">
			                <div><h4>Wykonał:</h4>
			                    <p>Damian Gralewicz, 2018 - 2019</p>
			                </div>
			           </div>
		            </div>
		        </div>
		        <div class="col-md-5">
		        	<a href="https://www.linkedin.com/in/damian-gralewicz-702931142/">
			        	<img src="http://icons-for-free.com/free-icons/png/512/272550.png" 
			        	style="height:45px;margin-top: 15px" alt="Profil do LinkedIn" />
		        	</a>
		        </div>
		      </div>
		    </div>
	    </div>
	</footer>
</body>
</html>