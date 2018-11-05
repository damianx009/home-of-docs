<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html >
<head>
	<title>Home of Docs</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,600|Raleway:600,300|Josefin+Slab:400,700,600italic,600,400italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/home.css">  
	
	
	
</head>
<body>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<!--BANNER START-->
  <div id="banner" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="jumbotron">
          <h1 class="small">Witamy w <span class="bold">Home of Docs</span></h1>
          <p class="big">Witrynie poświęconej systemowi Exstream oraz wydrukom.</p>
          <a href="${pageContext.request.contextPath}/about" class="btn btn-banner">Nie wiesz gdzie trafiłeś?<i class="fa fa-send"></i></a>
        </div>
      </div>
    </div>
  </div>
  <!--BANNER END-->

  <!--CTA1 START-->
  <div class="cta-1">
    <div class="container">
      <div class="row text-center white">
        <h1 class="cta-title">Chętnie pomożemy!!</h1>
        <p class="cta-sub-title">Odpowiemy na każde pytanie lub postaramy się pomóc.</p>
      </div>
    </div>
  </div>
  <!--CTA1 END-->

  <!--SERVICE START-->
  <div id="service" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="page-title text-center">
          <h1>Nasz serwis</h1>
          <p>Wykorzystując nowoczesne narzędzie OpenText Exstream tworzymy korespondencję firmową za pomocą wielu kanałów komunikacyjnych. <nobr>Tworzymy jakościowy produkt wraz z upraszczaniem procesów biznesowych.</nobr></p>
          <hr class="pg-titl-bdr-btm"></hr>
        </div>
        <div class="col-md-4">
          <div class="service-box">
            <div class="service-icon"><img src="${pageContext.request.contextPath}/img/design.jpg" alt=""></div>
            <div class="service-text">
              <h3>Design</h3>
              <p> Nowoczesna technologia pozwala na&nbsp;zaawansowaną warstwę prezentacji korespondencji, która jest&nbsp;przyjemna do&nbsp;odczytu.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="service-box">
            <div class="service-icon"><img src="${pageContext.request.contextPath}/img/code.jpg" alt=""></div>
            <div class="service-text">
              <h3>Development</h3>
              <p> Praca wytwórcza odbywa się w&nbsp;grupach oraz&nbsp;przechodzi cztery fazy testów by&nbsp;każda korespondecja była&nbsp;wysokiej&nbsp;jakości.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="service-box">
            <div class="service-icon"><img src="${pageContext.request.contextPath}/img/diamond.jpg" alt=""></div>
            <div class="service-text">
              <h3>Marketing</h3>
              <p> Projekt DMS spowodował że&nbsp;cała korespondencja została zautomatyzowana i&nbsp;klient może otrzymać swój&nbsp;dokument już&nbsp;po&nbsp;kilku&nbsp;sekundach!</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--SERVICE END-->
  <div id="portfolio">
    <div class="container">
      <div class="page-title text-center">
        <h1>Osoby tworzące </h1>
        <p>Jeśli masz pytanie <br>to skontaktuj się z jednym z naszych ambasadorów. </p>
        <hr class="pg-titl-bdr-btm"></hr>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <ul id="portfolio-flters">
            <li data-filter="${allFilterTypes}" class="filter-active">Wszyscy</li>
            
            <c:forEach items="${filterTypes}" var="filter">
			    <li data-filter=".filter-${filter.group}">${filter.description}</li>
			</c:forEach>
          </ul>
        </div>
      </div>

      <div class="row" id="portfolio-wrapper">
        <c:forEach items="${filterUsers}" var="user">
		    <div class="col-lg-3 col-md-6 portfolio-item filter-${user.filterType.group}"
		    	 style="margin-right: 0px">
	          <a href="${pageContext.request.contextPath}/info/profile/${user.id}" target="_blank" style="margin-right: 0px">
	            <img src="${pageContext.request.contextPath}/img/portfolio/${user.avatarImage}" alt="" 
	            style="height: 200px;display: block; margin-left: auto; margin-right: auto;">
	            <div class="details">
	              <h4>${user.firstName} ${user.lastName}</h4>
	              <span>${user.position}</span>
	            </div>
	          </a>
	        </div>
		</c:forEach>
      </div>
    </div>
  </div>

  <!--CTA2 START-->
  <div class="cta2" style="background-color:#0d0d0d;color:#808080">
   <div class="container" >
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
        	<a href="https://github.com/damianx009/home-of-docs">
	        	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBnl4puugda0c-WUueCJRZOEW9z0NW9QuapRNqBkjMRMSCnMHW" 
	        	style="height:45px;margin-left: 15px;margin-top: 15px" alt="Profil do LinkedIn" />
        	</a>
        </div>
      </div>
    </div>
  </div>
  <!--CTA2 END-->

  <script src="${pageContext.request.contextPath}/scripts/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/scripts/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/scripts/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/custom.js"></script>

	</body>
</html>