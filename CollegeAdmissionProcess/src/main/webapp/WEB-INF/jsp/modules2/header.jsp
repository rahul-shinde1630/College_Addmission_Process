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
	<!-- jQuery -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
					<h2 class="logo-text">Student Details</h2>
				</div>
			
			 </div>
			<ul class="metismenu" id="menu">
				    <li>
				        <a href="admindashbord"><i class='bx bx-home-alt'></i> Dashboard</a>
				    </li>
				    
				    <ul>
				  

				
				        <li>
				            <a href="studentList"><i class='bx bx-radio-circle'></i>Student Record</a>
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
               href="adminLoginpage"
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