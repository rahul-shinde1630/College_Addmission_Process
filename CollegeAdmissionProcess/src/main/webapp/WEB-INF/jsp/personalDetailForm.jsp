<jsp:include page="modules/header.jsp"/>

<!--start page wrapper -->
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <div class="col-10 mx-auto">
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4">Personal Details</h5>
                        <p style="color: green;">${successMsg}</p>
                        <p style="color: red;">${errMsg}</p>

                        <form class="row g-3" action="StudentPersonalDetails" method="post" onsubmit="return validatePersonalForm()">
                            
                            <!-- First Name -->
                            <div class="col-md-4">
                                <label for="fName" class="form-label">First Name: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="firstname" id="fName" placeholder="First Name" oninput="hideError('fNameErr')">
                                <small id="fNameErr" class="text-danger d-none">Only alphabets required</small>
                            </div>

                            <!-- Middle Name -->
                            <div class="col-md-4">
                                <label for="mName" class="form-label">Middle Name: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="middelname" id="mName" placeholder="Middle Name" oninput="hideError('mNameErr')">
                                <small id="mNameErr" class="text-danger d-none">Only alphabets allowed</small>
                            </div>

                            <!-- Last Name -->
                            <div class="col-md-4">
                                <label for="lName" class="form-label">Last Name: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="lastname" id="lName" placeholder="Last Name" oninput="hideError('lNameErr')">
                                <small id="lNameErr" class="text-danger d-none">Only alphabets required</small>
                            </div>

                            <!-- Email -->
                            <div class="col-md-8">
                                <label for="email" class="form-label">Email: <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="Email" oninput="hideError('emailErr')">
                                <small id="emailErr" class="text-danger d-none">Enter a valid email address</small>
                            </div>

                            <!-- DOB -->
                            <div class="col-md-4">
                                <label for="dob" class="form-label">DOB: <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" name="dob" id="dob" oninput="hideError('dobErr')">
                                <small id="dobErr" class="text-danger d-none">Date of birth is required</small>
                            </div>

                            <!-- Gender -->
                            <div class="col-md-4">
                                <label for="gender" class="form-label">Gender: <span class="text-danger">*</span></label>
                                <select name="gender" id="gender" class="form-select" oninput="hideError('genderErr')">
                                    <option value="" disabled selected>Choose...</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                                <small id="genderErr" class="text-danger d-none">Please select gender</small>
                            </div>

                            <!-- Blood Group -->
                            <div class="col-md-4">
                                <label for="bloodgroup" class="form-label">Blood Group: <span class="text-danger">*</span></label>
                                <select name="bloodgroup" id="bloodgroup" class="form-select" oninput="hideError('bloodErr')">
                                    <option value="" disabled selected>Choose...</option>
                                    <option>O+</option>
                                    <option>O-</option>
                                    <option>A+</option>
                                    <option>A-</option>
                                    <option>B+</option>
                                    <option>B-</option>
                                    <option>AB+</option>
                                    <option>AB-</option>
                                </select>
                                <small id="bloodErr" class="text-danger d-none">Please select blood group</small>
                            </div>

                            <!-- Mother's Name -->
                            <div class="col-md-4">
                                <label for="mothername" class="form-label">Mother's Name (First Name Only): <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="mothername" id="mothername" placeholder="Mother's Name" oninput="hideError('motherErr')">
                                <small id="motherErr" class="text-danger d-none">Only alphabets required</small>
                            </div>

                            <!-- Aadhaar No -->
                            <div class="col-md-6">
                                <label for="aadhaarno" class="form-label">Aadhaar No: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="aadhaarno" id="aadhaarno" placeholder="Aadhaar No" oninput="hideError('aadhaarErr')" maxlength="12">
                                <small id="aadhaarErr" class="text-danger d-none">Enter 12-digit Aadhaar number</small>
                            </div>

                            <!-- Mobile No -->
                            <div class="col-md-6">
                                <label for="mobileno" class="form-label">Mobile No: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="mobileno" id="mobileno" placeholder="Mobile No" oninput="hideError('mobileErr')" maxlength="10">
                                <small id="mobileErr" class="text-danger d-none">Enter 10-digit valid mobile number</small>
                            </div>

                            <!-- Submit Button -->
                            <div class="col-md-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary px-4">Save & Next</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="modules/footer.jsp"/>

<!-- JavaScript Validation -->
<script>
function validatePersonalForm() {
    let valid = true;

    // Utility function
    const getVal = id => document.getElementById(id).value.trim();

    // First name
    if (!/^[A-Za-z]+$/.test(getVal("fName"))) {
        showError("fNameErr"); valid = false;
    }

    // Middle name (optional)
    const mName = getVal("mName");
    if (mName && !/^[A-Za-z]+$/.test(mName)) {
        showError("mNameErr"); valid = false;
    }

    // Last name
    if (!/^[A-Za-z]+$/.test(getVal("lName"))) {
        showError("lNameErr"); valid = false;
    }

    // Email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(getVal("email"))) {
        showError("emailErr"); valid = false;
    }

    // DOB
    if (getVal("dob") === "") {
        showError("dobErr"); valid = false;
    }

    // Gender
    if (getVal("gender") === "") {
        showError("genderErr"); valid = false;
    }

    // Blood Group
    if (getVal("bloodgroup") === "") {
        showError("bloodErr"); valid = false;
    }

    // Mother's Name
    if (!/^[A-Za-z]+$/.test(getVal("mothername"))) {
        showError("motherErr"); valid = false;
    }

    // Aadhaar
    if (!/^\d{12}$/.test(getVal("aadhaarno"))) {
        showError("aadhaarErr"); valid = false;
    }

    // Mobile No
    if (!/^[6-9]\d{9}$/.test(getVal("mobileno"))) {
        showError("mobileErr"); valid = false;
    }

    return valid;
}

function showError(id) {
    document.getElementById(id).classList.remove("d-none");
}

function hideError(id) {
    document.getElementById(id).classList.add("d-none");
}
</script>
