<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="modules/header.jsp" />

<!-- SweetAlert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="page-wrapper">
    <div class="page-content">
        <div class="container mt-5">
            <h2>Student QR Code</h2>

            <!-- QR Generate Button -->
            <form action="generateQR" method="get">
                <input type="hidden" name="action" value="generate" />
                <input type="submit" value="Generate QR" class="btn btn-primary mb-4" />
            </form>

            <!-- Student Details 
            <c:if test="${not empty student}">
                <div class="card p-3 mb-4" style="border: 1px solid #ccc; border-radius: 10px;">
                    <p><strong>Name:</strong> ${student.firstname} ${student.middelname} ${student.lastname}</p>
                    <p><strong>Email:</strong> ${student.email}</p>
                    <p><strong>Mobile:</strong> ${student.mobileno}</p>
                    <p><strong>DOB:</strong> ${student.dob}</p>
                    <p><strong>Gender:</strong> ${student.gender}</p>
                    <p><strong>Blood Group:</strong> ${student.bloodgroup}</p>
                    <p><strong>Mother's Name:</strong> ${student.mothername}</p>
                    <p><strong>Aadhaar:</strong> ${student.aadhaarno}</p>
                </div>
            </c:if> --> 
            
            <!-- Show QR code if generated -->
            <c:if test="${not empty qrBase64}">
                <script>
                    Swal.fire({
                        icon: 'success',
                        title: 'QR Code Generated!',
                        text: 'You can scan the QR code to see student details.',
                        confirmButtonColor: '#3085d6'
                    });
                </script>

                <div class="qr-code-container text-center mt-4">
                    <h3>Scan the QR Code</h3>
                    <img src="data:image/png;base64,${qrBase64}" alt="QR Code" width="250" height="250" />
                    <p class="mt-2">Scan the QR code to verify your student identity.</p>
                </div>
            </c:if>

            <!-- Show error only if action was triggered -->
            <c:if test="${param.action eq 'generate' and empty qrBase64}">
                <p class="text-danger">QR code not generated. Please try again.</p>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="modules/footer.jsp" />
