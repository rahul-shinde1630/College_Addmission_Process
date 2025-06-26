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
								<h5 class="">Sign Up Here</h5>
								<p class="mb-0">Please fill the below details to create your Profile</p>
							</div>
							<div class="form-body">
								<form class="row g-3" id="signupForm" action="signupStudent" method="post">
									<div class="col-12">
										<label for="UserID" class="form-label">Register Student ID:</label>
										<input type="text" name="userid" class="form-control" id="UserID" placeholder="student ID">
										<small id="useridError" class="text-danger d-none">Student ID must be at least 5 alphanumeric characters.</small>
									</div>
									<div class="col-12">
										<label for="inputEmailAddress" class="form-label">Email Address:</label>
										<input type="email" name="email" class="form-control" id="inputEmailAddress" placeholder="example@user.com">
										<small id="emailError" class="text-danger d-none">Enter a valid email address.</small>
									</div>
									<div class="col-12">
										<label for="inputChoosePassword" class="form-label">Password:</label>
										<div class="input-group" id="show_hide_password">
											<input type="password" name="password" class="form-control border-end-0" id="inputChoosePassword" placeholder="Enter Password">
											<a href="javascript:void(0);" class="input-group-text toggle-password"><i class='bx bx-hide'></i></a>
										</div>
										<small id="passwordError" class="text-danger d-none">Password must be at least 6 characters long.</small>
									</div>
									<div class="col-12">
										<div class="form-check form-switch">
											<input class="form-check-input" name="check" type="checkbox" id="flexSwitchCheckChecked">
											<label class="form-check-label" for="flexSwitchCheckChecked">I read and agree to Terms & Conditions</label>
											<small id="termsError" class="text-danger d-none">You must agree to the terms.</small>
										</div>
									</div>
									<div class="col-12">
										<div class="d-grid">
											<button type="submit" class="btn btn-primary">Sign Up</button>
										</div>
									</div>
									<div class="col-12">
										<div class="text-center">
											<p class="mb-0">Already have an account? <a href="loginStudentPage">Sign in here</a></p>
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

<!-- JavaScript validation script -->
<script>
	const form = document.getElementById("signupForm");
	const userId = document.getElementById("UserID");
	const email = document.getElementById("inputEmailAddress");
	const password = document.getElementById("inputChoosePassword");
	const checkbox = document.getElementById("flexSwitchCheckChecked");

	const userIdError = document.getElementById("useridError");
	const emailError = document.getElementById("emailError");
	const passwordError = document.getElementById("passwordError");
	const termsError = document.getElementById("termsError");

	const userIdRegex = /^[a-zA-Z0-9]{5,}$/;
	const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	const passwordRegex = /^.{6,}$/;

	let submittedOnce = false;

	function showError(inputElem, errorElem, isValid) {
		if (!isValid) {
			errorElem.classList.remove("d-none");
			inputElem.classList.add("is-invalid");
			return false;
		} else {
			errorElem.classList.add("d-none");
			inputElem.classList.remove("is-invalid");
			return true;
		}
	}

	function validateFormFields() {
		const userIdVal = userId.value.trim();
		const emailVal = email.value.trim();
		const passwordVal = password.value.trim();

		let validUserId = showError(userId, userIdError, userIdRegex.test(userIdVal));
		let validEmail = showError(email, emailError, emailRegex.test(emailVal));
		let validPassword = showError(password, passwordError, passwordRegex.test(passwordVal));
		let termsChecked = checkbox.checked;

		if (!termsChecked) {
			termsError.classList.remove("d-none");
		} else {
			termsError.classList.add("d-none");
		}

		return validUserId && validEmail && validPassword && termsChecked;
	}

	// Real-time validation only if the form has been submitted once
	userId.addEventListener("keyup", () => {
		if (submittedOnce) showError(userId, userIdError, userIdRegex.test(userId.value.trim()));
	});
	email.addEventListener("keyup", () => {
		if (submittedOnce) showError(email, emailError, emailRegex.test(email.value.trim()));
	});
	password.addEventListener("keyup", () => {
		if (submittedOnce) showError(password, passwordError, passwordRegex.test(password.value.trim()));
	});

	// Submit event validation
	form.addEventListener("submit", function (e) {
		submittedOnce = true; // Enable real-time validation after first submit

		if (!validateFormFields()) {
			e.preventDefault(); // Stop form submission if validation fails
		}
	});

	// Show/hide password toggle
	document.querySelector(".toggle-password").addEventListener("click", function () {
		const passInput = document.getElementById("inputChoosePassword");
		const icon = this.querySelector("i");
		if (passInput.type === "password") {
			passInput.type = "text";
			icon.classList.remove("bx-hide");
			icon.classList.add("bx-show");
		} else {
			passInput.type = "password";
			icon.classList.remove("bx-show");
			icon.classList.add("bx-hide");
		}
	});
</script>

