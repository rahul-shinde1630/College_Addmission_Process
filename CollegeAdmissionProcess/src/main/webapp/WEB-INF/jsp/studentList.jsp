<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="modules2/header.jsp"/>
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <div class="container mt-5">
                <h2 class="mb-4">Student List</h2>
                <table class="table table-bordered text-center">
                    <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Gender</th>
                        <th>Action</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.firstname} ${student.middelname} ${student.lastname}</td>
                            <td>${student.email}</td>
                            <td>${student.mobileno}</td>
                            <td>${student.gender}</td>
                            <td>
                                <button type="button" class="btn btn-info view-profile-btn"
                                        data-id="${student.id}" data-toggle="modal" data-target="#profileModal">
                                    View Profile
                                </button>
                            </td>
                           <td>
					            <form action="deletes" method="get" style="display:inline;">
					             <input type="hidden" name="id" value="${student.id}" /> 
					                <button type="submit" class="btn btn-info  btn-danger" onclick="return confirm('Are you sure you want to delete this student?');">
					                    Delete
					                </button>
					            </form>
					        </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

          <!-- ... your header and table ... -->

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title" id="profileModalLabel">Student Profile</h5>
        <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body" id="profileModalBody">
        <!-- AJAX loaded content -->
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function () {
    $('.view-profile-btn').click(function () {
        var studentId = $(this).data('id');
        $.ajax({
            url: '${pageContext.request.contextPath}/getStudentProfile',
            type: 'GET',
            data: { id: studentId },
            success: function (data) {
                $('#profileModalBody').html(data);
                $('#profileModal').modal('show');
            },
            error: function () {
                $('#profileModalBody').html('<p class="text-danger">Failed to load profile. Please try again.</p>');
            }
        });
    });
});
</script>

<jsp:include page="modules2/footer.jsp"/>
