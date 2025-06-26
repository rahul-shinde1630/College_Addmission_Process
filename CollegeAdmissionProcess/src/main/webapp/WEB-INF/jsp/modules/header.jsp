<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="resources/assets/images/favicon-32x32.png" type="image/png"/>
	<!--plugins-->
	<link href="resources/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
	<link href="resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet"/>
	<!-- loader-->
	<link href="resources/assets/css/pace.min.css" rel="stylesheet"/>
	<script src="resources/assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/assets/css/bootstrap-extended.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
	<link href="resources/assets/css/app.css" rel="stylesheet">
	<link href="resources/assets/css/icons.css" rel="stylesheet">
	<!-- Theme Style CSS -->
	<link rel="stylesheet" href="resources/assets/css/dark-theme.css"/>
	<link rel="stylesheet" href="resources/assets/css/semi-dark.css"/>
	<link rel="stylesheet" href="resources/assets/css/style.css"/>
	<link rel="stylesheet" href="resources/assets/css/header-colors.css"/>
	<title> Student Dashboard </title>
</head>

<body>
	<!--wrapper-->
	<div class="wrapper">
		<!--sidebar wrapper -->
		<div class="sidebar-wrapper" data-simplebar="true">
			<div class="sidebar-header">
				<div>
					<img src="resources/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
				</div>
				<div>
					<h2 class="logo-text">Admission Process</h2>
				</div>
			
			 </div>
			<ul class="metismenu" id="menu">
				    <li>
				        <a href="studentDashboard"><i class='bx bx-home-alt'></i> Dashboard</a>
				    </li>
				    
				    <ul>
				     <c:if test="${sessionScope.admissionStatus != 'ADMITTED'}">
					    <li> <a href="personalDetailForm" class=""></i>Get Admission</a>
					</c:if>
					
					<c:if test="${sessionScope.admissionStatus == 'ADMITTED'}">
					    <button class="btn btn-secondary" >Already Admitted</button>
					</c:if>

				
				        <li>
				            <a href="updateStudentPage"><i class='bx bx-radio-circle'></i>Update Profile</a>
				        </li>
			  <li>
				            <a href="profileView"><i class='bx bx-radio-circle'></i>View Profile</a>
				        </li>
					<li>
				    <a href="generateQRPage"><i class='bx bx-radio-circle'></i>View QR</a>
				</li>

				    </ul>
				</ul>
		</div>
		<!--end sidebar wrapper -->
		<!--start header -->
		<header>
    <div class="topbar d-flex align-items-center">
        <nav class="navbar navbar-expand w-100 gap-3">
            <div class="mobile-toggle-menu"><i class='bx bx-menu'></i></div>
            
            <!-- Logout link aligned to the right -->
          <div class="ms-auto px-3">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="btn btn-outline-danger d-flex align-items-center px-3 py-2 rounded-pill shadow-sm" 
               href="${pageContext.request.contextPath}/logout"
               style="font-weight: 500; gap: 8px;">
                <i class="bx bx-log-out-circle fs-5"></i>
                <span>Logout</span>
            </a>
        </li>
    </ul>
</div>

        </nav>
    </div>
</header>

		<!--end header -->