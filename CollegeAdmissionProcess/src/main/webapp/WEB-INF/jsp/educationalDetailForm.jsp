<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<jsp:include page="modules/header.jsp"/>

<!--start page wrapper -->
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <div class="col-10 mx-auto">
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4">Educational Details</h5>
                        <form class="row g-3" action="EducationalDetails" method="post" onsubmit="return validateEducationalForm()">
                            
                            <!-- 10th Details -->
                            <h6>10th Details</h6>
                            <div class="col-md-4">
                                <label for="tenthMarks" class="form-label">10th Marks (%): <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="tenthMarks" id="tenthMarks" min="0" max="100" oninput="hideError('tenthMarksErr'); hideAsterisk('tenthMarks')" required>
                                <small id="tenthMarksErr" class="text-danger d-none">Please enter a valid percentage (0-100)</small>
                            </div>
                            <div class="col-md-4">
                                <label for="tenthBoard" class="form-label">Board Name: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="tenthBoard" id="tenthBoard" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" oninput="hideError('tenthBoardErr'); hideAsterisk('tenthBoard')" required>
                                <small id="tenthBoardErr" class="text-danger d-none">Board name cannot be empty and must only contain alphabets</small>
                            </div>
                            <div class="col-md-4">
                                <label for="tenthYear" class="form-label">Passing Year: <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="tenthYear" id="tenthYear" min="2000" max="2030" oninput="hideError('tenthYearErr'); hideAsterisk('tenthYear')" required>
                                <small id="tenthYearErr" class="text-danger d-none">Enter a valid year</small>
                            </div>
                            
                            <!-- 12th Details -->
                            <h6>12th/Diploma Details</h6>
                            <div class="col-md-4">
                                <label for="twelfthMarks" class="form-label">12th/Diploma Marks (%): <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="twelfthMarks" id="twelfthMarks" min="0" max="100" oninput="hideError('twelfthMarksErr'); hideAsterisk('twelfthMarks')" required>
                                <small id="twelfthMarksErr" class="text-danger d-none">Please enter a valid percentage (0-100)</small>
                            </div>
                            <div class="col-md-4">
                                <label for="twelfthBoard" class="form-label">Board Name: <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="twelfthBoard" id="twelfthBoard" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" oninput="hideError('twelfthBoardErr'); hideAsterisk('twelfthBoard')" required>
                                <small id="twelfthBoardErr" class="text-danger d-none">Board name cannot be empty and must only contain alphabets</small>
                            </div>
                            <div class="col-md-4">
                                <label for="twelfthYear" class="form-label">Passing Year: <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" name="twelfthYear" id="twelfthYear" min="2000" max="2030" oninput="hideError('twelfthYearErr'); hideAsterisk('twelfthYear')" required>
                                <small id="twelfthYearErr" class="text-danger d-none">Enter a valid year</small>
                            </div>
                         
                            <!-- Course Selection -->
                            <h6>Course Selection</h6>
                            <div class="col-md-6">
                                <label for="course" class="form-label">Degree Course: <span class="text-danger">*</span></label>
                                <select name="course" id="course" class="form-select" oninput="hideError('courseErr'); hideAsterisk('course')" required>
                                    <option value="">Choose...</option>
                                    <option value="B.Tech">B.Tech</option>
                                    <option value="M.Tech">M.Tech</option>
                                    <option value="BCA">BCA</option>
                                    <option value="MCA">MCA</option>
                                    <option value="B.Sc">B.Sc</option>
                                    <option value="M.Sc">M.Sc</option>
                                </select>
                                <small id="courseErr" class="text-danger d-none">Please select a course</small>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="studyMode" class="form-label">Study Mode: <span class="text-danger">*</span></label>
                                <select name="studyMode" id="studyMode" class="form-select" oninput="hideError('studyModeErr'); hideAsterisk('studyMode')" required>
                                    <option value="">Choose...</option>
                                    <option value="Offline">Offline</option>
                                    <option value="Online">Online</option>
                                </select>
                                <small id="studyModeErr" class="text-danger d-none">Please select a study mode</small>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="admissionYear" class="form-label">Admission Date: <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" name="admissionYear" id="admissionYear" min="2024" max="2030" oninput="hideError('admissionYearErr'); hideAsterisk('admissionYear')" required>
                                <small id="admissionYearErr" class="text-danger d-none">Please select a valid admission date</small>
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
function validateEducationalForm() {
    let valid = true;

    // Utility function to get values
    const getVal = id => document.getElementById(id).value.trim();

    // 10th Marks
    if (getVal("tenthMarks") < 0 || getVal("tenthMarks") > 100) {
        showError("tenthMarksErr"); valid = false;
    }

    // 10th Board
    if (getVal("tenthBoard") === "" || !/^[A-Za-z\s]+$/.test(getVal("tenthBoard"))) {
        showError("tenthBoardErr"); valid = false;
    }

    // 10th Year
    if (getVal("tenthYear") < 2000 || getVal("tenthYear") > 2030) {
        showError("tenthYearErr"); valid = false;
    }

    // 12th Marks
    if (getVal("twelfthMarks") < 0 || getVal("twelfthMarks") > 100) {
        showError("twelfthMarksErr"); valid = false;
    }

    // 12th Board
    if (getVal("twelfthBoard") === "" || !/^[A-Za-z\s]+$/.test(getVal("twelfthBoard"))) {
        showError("twelfthBoardErr"); valid = false;
    }

    // 12th Year
    if (getVal("twelfthYear") < 2000 || getVal("twelfthYear") > 2030) {
        showError("twelfthYearErr"); valid = false;
    }

    // Course
    if (getVal("course") === "") {
        showError("courseErr"); valid = false;
    }

    // Study Mode
    if (getVal("studyMode") === "") {
        showError("studyModeErr"); valid = false;
    }

    // Admission Year
    if (getVal("admissionYear") === "") {
        showError("admissionYearErr"); valid = false;
    }

    return valid;
}

function showError(id) {
    document.getElementById(id).classList.remove("d-none");
}

function hideError(id) {
    document.getElementById(id).classList.add("d-none");
}

function hideAsterisk(id) {
    const asterisk = document.querySelector(`#${id} + .form-label span`);
    if (document.getElementById(id
