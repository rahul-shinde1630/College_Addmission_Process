<jsp:include page="module/header.jsp"/>
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
								<h5 class="">Sign In Here</h5>
								<p class="mb-0">Please fill the below details to create your Profile</p>
							</div>
							<div class="form-body">
								<form class="row g-3" action="loginStudent" method="post" onsubmit="return validateForm()">
									
									<!-- Student ID -->
									<div class="col-12">
										<label for="UserID" class="form-label">Registered Student ID:</label>
										<input type="text" name="userid" class="form-control" id="UserID" placeholder="Student ID" oninput="hideError('userIdError')">
										<small id="userIdError" class="text-danger d-none">Please enter your Student ID</small>
									</div>
									
									<!-- Email -->
									<div class="col-12">
										<label for="inputEmailAddress" class="form-label">Registered Email Address:</label>
										<input type="email" name="email" class="form-control" id="inputEmailAddress" placeholder="example@user.com" oninput="hideError('emailError')">
										<small id="emailError" class="text-danger d-none">Please enter a valid Email Address</small>
									</div>
									
									<!-- Password -->
									<div class="col-12">
										<label for="inputChoosePassword" class="form-label">Password:</label>
										<div class="input-group" id="show_hide_password">
											<input type="password" name="password" class="form-control border-end-0" id="inputChoosePassword" placeholder="Enter Password" oninput="hideError('passwordError')">
											<a href="javascript:;" class="input-group-text" onclick="togglePassword()"><i class='bx bx-hide'></i></a>
										</div>
										<small id="passwordError" class="text-danger d-none">Password must be at least 6 characters</small>
									</div>

									<!-- Submit -->
									<div class="col-12">
										<div class="d-grid">
											<button type="submit" class="btn btn-primary">Sign in</button>
										</div>
									</div>

									<!-- Sign Up link -->
									<div class="col-12">
										<div class="text-center">
											<p class="mb-0">Don't have an account? <a href="signupStudentPage">Sign Up here</a></p>
										</div>
									</div>

								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="module/footer.jsp"/>

<!-- ✅ JavaScript -->
<script>
	function validateForm() {
		let valid = true;

		const userId = document.getElementById("UserID").value.trim();
		const email = document.getElementById("inputEmailAddress").value.trim();
		const password = document.getElementById("inputChoosePassword").value.trim();

		// Student ID
		if (userId === "") {
			showError("userIdError");
			valid = false;
		}

		// Email
		const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (email === "" || !emailPattern.test(email)) {
			showError("emailError");
			valid = false;
		}

		// Password
		if (password === "" || password.length < 6) {
			showError("passwordError");
			valid = false;
		}

		return valid;
	}

	function showError(id) {
		document.getElementById(id).classList.remove("d-none");
	}

	function hideError(id) {
		document.getElementById(id).classList.add("d-none");
	}

	function togglePassword() {
		const input = document.getElementById("inputChoosePassword");
		const icon = input.nextElementSibling.querySelector("i");
		if (input.type === "password") {
			input.type = "text";
			icon.classList.replace("bx-hide", "bx-show");
		} else {
			input.type = "password";
			icon.classList.replace("bx-show", "bx-hide");
		}
	}
</script>
