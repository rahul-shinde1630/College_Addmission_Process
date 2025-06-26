<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="modules/header.jsp"/>
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="page-wrapper">
    <div class="page-content">
        <div class="container mt-5">
          <!-- Profile Button -->
            <form action="viewProfile" method="get">
                <input type="hidden" name="action" value="viewProfile" />
                <input type="submit" value="viewProfile" class="btn btn-primary mb-4" />
            </form>
            
            <div class="card p-3 mb-4" style="border: 1px solid #ccc; border-radius: 10px;">
                <!-- Create a row with two columns: one for the info, one for the image -->
                <div class="row">
                    <!-- Left Column for Student Info -->
                    <div class="col-md-8">
                        <table class="table table-bordered">
                            <tr>
                                <td><strong>Name:</strong></td>
                                <td>${student.firstname} ${student.middelname} ${student.lastname}</td>
                            </tr>
                            <tr>
                                <td><strong>Email:</strong></td>
                                <td>${student.email}</td>
                            </tr>
                            <tr>
                                <td><strong>Mobile:</strong></td>
                                <td>${student.mobileno}</td>
                            </tr>
                            <tr>
                                <td><strong>DOB:</strong></td>
                                <td>${student.dob}</td>
                            </tr>
                            <tr>
                                <td><strong>Gender:</strong></td>
                                <td>${student.gender}</td>
                            </tr>
                            <tr>
                                <td><strong>Blood Group:</strong></td>
                                <td>${student.bloodgroup}</td>
                            </tr>
                            <tr>
                                <td><strong>Mother's Name:</strong></td>
                                <td>${student.mothername}</td>
                            </tr>
                            <tr>
                                <td><strong>Aadhaar:</strong></td>
                                <td>${student.aadhaarno}</td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- Right Column for Student Photo -->
                    <div class="col-md-4 text-center pt-10">
                        <c:if test="${not empty studentDoc.photoPath}">
                            <img src="${pageContext.request.contextPath}${studentDoc.photoPath}" width="150" height="150" class="img-fluid" />
                        </c:if>
                    </div>
                </div>
            </div>

          
        </div>
    </div>
</div>
<c:if test="${profileGenerated}">
<script>
    Swal.fire({
        title: 'Success!',
        text: 'Profile Generated',
        icon: 'success',
        confirmButtonText: 'OK'
    });
</script>
</c:if>

<jsp:include page="modules/footer.jsp"/>
