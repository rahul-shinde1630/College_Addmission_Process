<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="modules/header.jsp"/>
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <h6 class="mb-0 text-uppercase">Student Document Upload Form</h6>
            <p style="color: green;">${successMsg}</p>
            <p style="color: red;">${errMsg}</p>
            <hr/>
            <div class="card">
                <div class="card-body">
                    <form action="submitDocuments" method="post" enctype="multipart/form-data">
                        <!-- 🔐 Hidden Student ID from session -->
                        <input type="hidden" name="studentId" value="${sessionScope.studentId}" />

                        <div class="input-group mb-3">
                            <label class="input-group-text" for="aadhar">Aadhar Card</label>
                            <input type="file" name="aadhar" class="form-control" id="aadhar" required>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="marksheet">12th Marksheet</label>
                            <input type="file" name="marksheet" class="form-control" id="marksheet" required>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="tc">Transfer Certificate (TC)</label>
                            <input type="file" name="tc" class="form-control" id="tc" required>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="photo">Passport Size Photo</label>
                            <input type="file" name="photo" class="form-control" id="photo" accept="image/*" required>
                        </div>
                        <div class="input-group">
                            <button class="btn btn-primary w-100" type="submit">Submit Documents</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="modules/footer.jsp"/>
<script>
    window.addEventListener("DOMContentLoaded", function () {
        const successMsg = "${successMsg}";
        const errMsg = "${errMsg}";

        if (successMsg === "Documents submitted successfully") {
            Swal.fire({
                icon: 'success',
                title: 'Admission Process Completed',
                text: 'Now go to your profile page.',
                confirmButtonText: 'Go to Profile',
                confirmButtonColor: '#3085d6'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'profile';
                }
            });
        } else if (successMsg) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: successMsg,
                confirmButtonColor: '#3085d6'
            });
        }

        if (errMsg) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: errMsg,
                confirmButtonColor: '#d33'
            });
        }
    });
</script>


