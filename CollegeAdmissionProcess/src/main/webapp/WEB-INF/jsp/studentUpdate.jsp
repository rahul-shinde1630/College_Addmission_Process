<%@ page session="true" %>
<jsp:include page="modules/header.jsp"/>

<!--start page wrapper -->
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <div class="col-10 mx-auto">
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4">Update Profile</h5>
                        <p style="color: green;">${successMsg}</p>
                        <p style="color: red;">${errMsg}</p>

                        <form class="row g-3" id="studentForm">
                            <input type="hidden" id="userId" value="${sessionScope.userid}">

                            <div class="col-md-4">
                                <label for="fName" class="form-label">First Name:</label>
                                <input type="text" class="form-control" id="fName" required pattern="[A-Za-z]+" title="Only alphabets allowed">
                            </div>

                            <div class="col-md-4">
                                <label for="mName" class="form-label">Middle Name:</label>
                                <input type="text" class="form-control" id="mName" pattern="[A-Za-z]+" title="Only alphabets allowed">
                            </div>

                            <div class="col-md-4">
                                <label for="lName" class="form-label">Last Name:</label>
                                <input type="text" class="form-control" id="lName" required pattern="[A-Za-z]+" title="Only alphabets allowed">
                            </div>

                            <div class="col-md-8">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="email" required>
                            </div>

                            <div class="col-md-4">
                                <label for="dob" class="form-label">DOB:</label>
                                <input type="date" class="form-control" id="dob" required>
                            </div>

                            <div class="col-md-4">
                                <label for="gender" class="form-label">Gender:</label>
                                <select id="gender" class="form-select" required>
                                    <option value="" disabled selected>Choose...</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="bloodgroup" class="form-label">Blood Group:</label>
                                <select id="bloodgroup" class="form-select" required>
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
                            </div>

                            <div class="col-md-4">
                                <label for="mothername" class="form-label">Mother's Name</label>
                                <input type="text" class="form-control" id="mothername" required pattern="[A-Za-z]+" title="Only alphabets allowed">
                            </div>

                            <div class="col-md-6">
                                <label for="aadhaarno" class="form-label">Aadhaar No:</label>
                                <input type="text" class="form-control" id="aadhaarno" required pattern="\d{12}" maxlength="12">
                            </div>

                            <div class="col-md-6">
                                <label for="mobileno" class="form-label">Mobile No:</label>
                                <input type="text" class="form-control" id="mobileno" required pattern="[6-9]\d{9}" maxlength="10">
                            </div>

                            <div class="col-md-12">
                                <div class="d-md-flex d-grid align-items-center gap-3">
                                    <button type="submit" class="btn btn-primary px-4">Save </button>
                                    <a href="studentUpdateAddress" class=" btn btn-primary px-2">Next</a>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="modules/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
    const userId = $('#userId').val();

    $.ajax({
        url: '/CollegeAdmissionProcess/getStudentDetails',
        method: 'GET',
        success: function(data) {
            if (data) {
                $('#fName').val(data.firstname);
                $('#mName').val(data.middelname);
                $('#lName').val(data.lastname);
                $('#email').val(data.email);
                $('#dob').val(data.dob);
                $('#gender').val(data.gender);
                $('#bloodgroup').val(data.bloodgroup);
                $('#mothername').val(data.mothername);
                $('#aadhaarno').val(data.aadhaarno);
                $('#mobileno').val(data.mobileno);
            } else {
                alert("Please Get Admission.");
            }
        },
        error: function() {
            alert("Error loading profile.");
        }
    });

    $('#studentForm').on('submit', function(e) {
        e.preventDefault();

        const studentData = {
        	    userid: userId,  // ✅ Fix this field name
        	    firstname: $('#fName').val(),
        	    middelname: $('#mName').val(),
        	    lastname: $('#lName').val(),
        	    email: $('#email').val(),
        	    dob: $('#dob').val(),
        	    gender: $('#gender').val(),
        	    bloodgroup: $('#bloodgroup').val(),
        	    mothername: $('#mothername').val(),
        	    aadhaarno: $('#aadhaarno').val(),
        	    mobileno: $('#mobileno').val()
        	};

        $.ajax({
            url: '/CollegeAdmissionProcess/updateStudentByUserId',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(studentData),
            success: function(response) {
            	if (response === "success") {
            	    alert("Profile updated successfully!");
            	    window.location.href = "studentUpdateAddress";
            	}

                 else {
                    alert("Failed to update profile.");
                }
            },
            error: function() {
                alert("Server error while updating.");
            }
        });
    });
});
</script>

