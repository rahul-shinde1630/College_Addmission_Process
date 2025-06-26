<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row mb-3">
   

    </div>
    <div class=" text-center">
        <img src="${pageContext.request.contextPath}/resources/qr/${qrCodePath}" width="120" height="120" alt="QR Code"/>
        <p><strong>QR Code</strong></p>
    </div>


<table class="table table-bordered">
    <tr><th>Full Name</th><td>${student.firstname} ${student.middelname} ${student.lastname}</td></tr>
    <tr><th>Email</th><td>${student.email}</td></tr>
    <tr><th>Mobile</th><td>${student.mobileno}</td></tr>
    <tr><th>DOB</th><td>${student.dob}</td></tr>
    <tr><th>Gender</th><td>${student.gender}</td></tr>
    <tr><th>Blood Group</th><td>${student.bloodgroup}</td></tr>
    <tr><th>Mother's Name</th><td>${student.mothername}</td></tr>
    <tr><th>Aadhaar No</th><td>${student.aadhaarno}</td></tr>
    <tr><th>Admission Status</th><td>${student.admission_status}</td></tr>
    <tr><th>User ID</th><td>${student.userid}</td></tr>
</table>
