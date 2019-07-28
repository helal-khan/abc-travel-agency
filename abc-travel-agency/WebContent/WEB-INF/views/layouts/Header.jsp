<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ABC Travel Agency | ${pageTitle}</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="Theme Region">
		<link rel="icon" href="${pageContext.request.contextPath}/static/images/globe.png">
		<!-- CSS Library-->
<%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"> --%>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/datepicker3.css" type="text/css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/icofont.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/slidr.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/main.css" type="text/css">		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/preset1.css" id="preset">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/responsive.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/css/toastr.css">
		<!-- CSS Custom-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/style/style.css" type="text/css">
		<style type="text/css">
/* 			#field { margin-left: .5em; float: left; } */
/* 			#field, label { float: left; font-family: Arial, Helvetica, sans-serif; font-size: small; } */
/* 			br { clear: both; } */
			input { border: 1px solid black; margin-bottom: .5em;  }
			input.error { border: 1px solid red;margin-top: 0px!important; }
			label.error {
				color:red;
				font-weight: bold;
			}
			label.valid{
/* 			    background:url(https://jqueryvalidation.org/files/demo/images/checked.gif) no-repeat; */
content: "\f058";  /* this is your text. You can also use UTF-8 character codes as I do here */
    font-family: FontAwesome;
			    float: right;
			    display:block;
			    width:16px;
			    height:16px
			}
			.user-icon{
				font-size: 17px!important;
			}
			.head-text{
				margin-top: 10px;
				font-weight: bold;
			}
			.write-post-btn{
				border-color: #37BC9B;
			    background-color: #37BC9B;
			    color: #FFFFFF;
			}
			.dropdown-menu {
				left: -63%;
				min-width: 0px;
			}
		</style>
		
		<!-- font -->
<!-- 		<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300' rel='stylesheet' type='text/css'> -->
<!-- 		<link href='https://fonts.googleapis.com/css?family=Signika+Negative:400,300,600,700' rel='stylesheet' type='text/css'> -->
		
		<!-- icons -->
<!-- 		<link rel="icon" href="images/ico/favicon.ico"> -->
<!-- 		<link rel="apple-touch-icon" sizes="144x144" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-144-precomposed.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="114x114" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-114-precomposed.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="72x72" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-72-precomposed.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="57x57" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-57-precomposed.png"> -->
	</head>
<body>
	<!-- header -->
	<input type="hidden" value="${pageContext.request.contextPath}" id="context-path"  />
	<header id="header" class="clearfix">
		<!-- navbar -->
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- navbar-header -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}">
						<img class="img-responsive" width="40px" height="40px" src="${pageContext.request.contextPath}/static/images/globe.png" alt="Logo"></a>
						<a class="navbar-brand head-text" href="${pageContext.request.contextPath}">ABC Travel Agency</a>
				</div>
				<!-- /navbar-header -->

				<div class="navbar-left">
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a
								href="${pageContext.request.contextPath}">Home</a></li>
							<li><button onclick="window.location.href = '${pageContext.request.contextPath}/profile';" class="btn btn-primary btn-post btn-xs"><i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;Create post</button></li>
						</ul>
					</div>
				</div>
				<!-- navbar-left -->

				<!-- nav-right -->
				<div class="nav-right">
					<sec:authorize access="!isAuthenticated()">
						<ul class="sign-in" style="display: inline;">
							<li class="bold"><i class="fas fa-sign-in-alt user-icon"></i><a href="${pageContext.request.contextPath}/login"> Login</a>&nbsp;&nbsp;&nbsp;</li>
							<li class="bold"><i class="fas fa-user-plus user-icon"></i> <a href="${pageContext.request.contextPath}/user-registration"> Register</a></li>
							<li style="display: none;"></li>
						</ul>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<ul class="sign-in" style="display: inline;">
							<li class="dropdown">
							  <i class="far fa-user-circle user-icon"></i> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><sec:authentication property="principal.username" /> <span class="caret"></span></a>				
							  <ul class="dropdown-menu" role="menu">
				                <li>
				                	<a href="${pageContext.request.contextPath}/profile"><i class="fa fa-user" aria-hidden="true"></i> Profile</a>
			                	</li>
				                <li>
				                	<a href="#"><i class="fa fa-unlock-alt" aria-hidden="true"></i> Change Password</a>
			                	</li>
				                <li>
				                	<a href="javascript:$.logout()"><i class="fa fa-sign-out" aria-hidden="true"></i> Log Out</a>
				                </li>
				              </ul>                
				            </li>
						</ul>
					</sec:authorize>	
				
				
<%-- 					<c:choose> --%>
<%-- 					  <c:when test="${!empty sessionScope.isLoggedIn}"> --%>
<!-- 					    <ul class="sign-in" style="display: inline;"> -->
<!-- 				        	<li class="dropdown"> -->
<!-- 							  <i class="fa fa-user-circle-o" aria-hidden="true"></i> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Waliul Hasan <span class="caret"></span></a>				 -->
<!-- 							  <ul class="dropdown-menu" role="menu"> -->
<!-- 				                <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i> Profile</a></li> -->
<!-- 				                <li><a href="#"><i class="fa fa-handshake-o" aria-hidden="true"></i> Activity</a></li> -->
<!-- 				                <li><a href="#" data-toggle="modal" id="ChangePasswordOpen" data-target="#changePassword"><i class="fa fa-unlock-alt" aria-hidden="true"></i> Change Password</a></li> -->
<%-- 				                <li><a href="${pageContext.request.contextPath}/SignOut"><i class="fa fa-sign-out" aria-hidden="true"></i> Log Out</a></li> --%>
<!-- 				              </ul>                 -->
<!-- 				            </li> -->
<!-- 						</ul> -->
<%-- 					  </c:when> --%>
<%-- 					  <c:otherwise> --%>
<!-- 						<ul class="sign-in" style="display: inline;"> -->
<%-- 						<li><i class="fa fa-user"></i><a href="<c:url value="/logout" />">Logout</a>&nbsp;&nbsp;&nbsp;</li> --%>
						
<%-- 							<li><i class="fa fa-user"></i><a href="${pageContext.request.contextPath}/Login"> লগইন</a>&nbsp;&nbsp;&nbsp;</li> --%>
							
<%-- 							<li><i class="fa fa-user-plus" aria-hidden="true"></i> <a href="${pageContext.request.contextPath}/UserRegistration"> রেজিস্টার</a></li> --%>
<!-- 							<li style="display: none;"></li> -->
<!-- 						</ul> -->
<%-- 					  </c:otherwise> --%>
<%-- 					</c:choose> --%>
				</div>
				<!-- nav-right -->
			</div>
			<!-- container -->
		</nav>
		<!-- navbar -->
	</header>
	<!-- header -->
    <c:url var="logoutUrl" value="/logout" /> 
    <form action="${logoutUrl}" method="post" id="logoutForm">
	    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
	</form>