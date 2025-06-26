<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--favicon-->
	<link rel="icon" href="resources/assets/images/favicon-32x32.png" type="image/png" />
	<!--plugins-->
	<link href="resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
	<!-- loader-->
	<link href="resources/assets/css/pace.min.css" rel="stylesheet" />
	<script src="resources/assets/js/pace.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/assets/css/bootstrap-extended.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&amp;display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<link href="resources/assets/css/app.css" rel="stylesheet">
	<link href="resources/assets/css/icons.css" rel="stylesheet">
	<link href="resources/assets/css/style.css" rel="stylesheet">
	<title>Student Admission </title>
</head>

	<!--wrapper-->
	<div class="wrapper">
		<header class="login-header shadow">
			<div class="card">
					<div class="card-body">
						<nav class="navbar navbar-expand-lg navbar-dark bg-light rounded">
							<div class="container-fluid">	
							   <h4 class="text-dark">Admission Process</h4>
								
							
							</div>
						</nav>
					</div>
				</div>
			</header>
		</div>
		<div class="d-flex align-items-center justify-content-center my-5">
			<div class="container-fluid">
				<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-3">
					<div class="col mx-auto">
						<div class="card my-5 shadow-none border">
							<div class="card-body">
									<div class="p-4">
		           						  <p style="color: green;">${successMsg}</p>
		           						  <p style="color: red;">${errMsg}</p>
									<div class="text-center mb-4">
										<h5 class="">Admin Login Here</h5>
										
									</div>
									<div class="form-body">
										<form class="row g-3" action="loginadmin" method="post">
											<div class="col-12">
												<label for="username" class="form-label">Username:</label>
												<input type="text" name="username" class="form-control" id="UserID" placeholder="username" required="required">
											</div>
											
											<label for="userRole" class="form-label mt-2">Select Role:</label>
   											  <select name="role" id="userRole" class="form-control" required>
     											   <option value="">-- Select Role --</option>
   												   <option value="HOD">HOD</option>
     											   <option value="PRINCIPAL">PRINCIPAL</option>
     											   <option value="CLERK">CLERK</option>
  											  </select>
											
											<div class="col-12">
  												<label for="inputChoosePassword" class="form-label">Password:</label>
  													<div class="input-group" id="show_hide_password">
    												<input type="password" name="password" class="form-control border-end-0" id="inputChoosePassword" placeholder="Enter Password" required>
  													 <a href="javascript:;" class="input-group-text" id="togglePassword">
    												 <i class='bx bx-hide' id="eyeIcon"></i>
   													 </a>
 													 </div>
											</div>


			
											
											<div class="col-12">
												<div class="d-grid">
													<button type="submit" class="btn btn-primary">Sign in</button>
												</div>
											</div>
											
										</form>
									</div>
									
								

								</div>
							</div>
						</div>
					</div>
				</div>
				<!--end row-->
			</div>
		</div>
		<!--start overlay-->
		<div class="overlay toggle-icon">
		<!--end overlay-->
		<!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
		<!--End Back To Top Button-->
		<footer class="page-footer">
			<p class="mb-0">Copyright © 2023. All right reserved.</p>
		</footer>
	</div>
	<!--end wrapper-->


</body>
</html>	
		<script>
  const togglePassword = document.getElementById('togglePassword');
  const passwordInput = document.getElementById('inputChoosePassword');
  const eyeIcon = document.getElementById('eyeIcon');

  togglePassword.addEventListener('click', function () {
    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', type);
    
    // Toggle the icon
    eyeIcon.classList.toggle('bx-hide');
    eyeIcon.classList.toggle('bx-show');
  });
</script>
