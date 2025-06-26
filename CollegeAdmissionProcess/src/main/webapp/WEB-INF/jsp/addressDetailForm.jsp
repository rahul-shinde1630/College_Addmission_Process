<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<jsp:include page="modules/header.jsp"/>

<!-- Start page wrapper -->
<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <div class="col-10 mx-auto">
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4"> Address Details</h5>
                        <p style="color: green;">${successMsg}</p>
                        <p style="color: red;">${errMsg}</p>
                        <form class="row g-3" action="SubmitAddress" method="post" onsubmit="return validateForm()">

                            <h6>Address Details</h6>

                            <!-- Current Address -->
                            <div class="col-md-6">
                                <label for="currentAddress" class="form-label">Current Address:</label>
                                <input type="text" class="form-control" name="currentAddress" id="currentAddress" placeholder="Enter your current address" required>
                                <small id="currentAddressError" class="text-danger" style="display: none;">Please enter your current address.</small>
                            </div>

                            <!-- Village Selection -->
                            <div class="col-md-4">
                                <label for="currentVillage" class="form-label">Village:</label>
                                <input type="text" class="form-control" name="currentVillage" id="currentVillage" placeholder="Enter your village name" required>
                                <small id="currentVillageError" class="text-danger" style="display: none;">Please enter your village name.</small>
                            </div>

                            <!-- Tahsil Selection -->
                            <div class="col-md-4">
                                <label for="tahsil" class="form-label">Tahsil:</label>
                                <input type="text" class="form-control" name="tahsil" id="tahsil" list="tahsilList" placeholder="Select your tahsil" required>
                                <datalist id="tahsilList">
                                    <option value="Amravati">
                                    <option value="Nagpur">
                                    <option value="Pune">
                                    <option value="Nashik">
                                    <option value="Satara">
                                </datalist>
                                <small id="tahsilError" class="text-danger" style="display: none;">Please select a tahsil.</small>
                            </div>

                            <!-- District Selection -->
                            <div class="col-md-4">
                                <label for="currentDistrict" class="form-label">District:</label>
                                <input type="text" class="form-control" name="currentDistrict" id="currentDistrict" list="districtList" placeholder="Select your district" required>
                                <datalist id="districtList">
                                    <option value="Mumbai">
                                    <option value="Pune">
                                    <option value="Nagpur">
                                    <option value="Thane">
                                    <option value="Nashik">
                                </datalist>
                                <small id="currentDistrictError" class="text-danger" style="display: none;">Please select a district.</small>
                            </div>

                            <!-- State Selection -->
                            <div class="col-md-4">
                                <label for="state" class="form-label">State:</label>
                                <input type="text" class="form-control" name="state" id="state" list="stateList" placeholder="Select your state" required>
                                <datalist id="stateList">
                                    <option value="Andhra Pradesh">
                                    <option value="Arunachal Pradesh">
                                    <option value="Assam">
                                    <option value="Bihar">
                                    <option value="Chhattisgarh">
                                    <option value="Goa">
                                    <option value="Gujarat">
                                    <option value="Haryana">
                                    <option value="Himachal Pradesh">
                                    <option value="Jharkhand">
                                    <option value="Karnataka">
                                    <option value="Kerala">
                                    <option value="Madhya Pradesh">
                                    <option value="Maharashtra">
                                    <option value="Manipur">
                                    <option value="Meghalaya">
                                    <option value="Mizoram">
                                    <option value="Nagaland">
                                    <option value="Odisha">
                                    <option value="Punjab">
                                    <option value="Rajasthan">
                                    <option value="Sikkim">
                                    <option value="Tamil Nadu">
                                    <option value="Telangana">
                                    <option value="Tripura">
                                    <option value="Uttar Pradesh">
                                    <option value="Uttarakhand">
                                    <option value="West Bengal">
                                </datalist>
                                <small id="stateError" class="text-danger" style="display: none;">Please select a state.</small>
                            </div>

                            <!-- Pincode -->
                            <div class="col-md-4">
                                <label for="pincode" class="form-label">Pincode:</label>
                                <input type="number" class="form-control" name="pincode" id="pincode" min="100000" max="999999" placeholder="Enter 6-digit pincode" required>
                                <small id="pincodeError" class="text-danger" style="display: none;">Please enter a valid 6-digit pincode.</small>
                            </div>

                            <!-- Country Selection -->
                            <div class="col-md-6">
                                <label for="country" class="form-label">Country:</label>
                                <input type="text" class="form-control" name="country" id="country" list="countryList" placeholder="Select your country" required>
                                <datalist id="countryList">
                                    <option value="India">
                                    <option value="USA">
                                    <option value="UK">
                                    <option value="Canada">
                                    <option value="Australia">
                                    <option value="Germany">
                                    <option value="France">
                                    <option value="China">
                                    <option value="Japan">
                                    <option value="South Korea">
                                </datalist>
                                <small id="countryError" class="text-danger" style="display: none;">Please select a country.</small>
                            </div>

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

<!-- JavaScript for Filtering Dropdowns and Validation -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    function filterOptions(inputId, datalistId) {
        let input = document.getElementById(inputId);
        let datalist = document.getElementById(datalistId);
        let options = Array.from(datalist.options);

        input.addEventListener("input", function() {
            let filter = input.value.toLowerCase();
            datalist.innerHTML = "";  // Clear datalist
            options.forEach(option => {
                if (option.value.toLowerCase().startsWith(filter)) {
                    datalist.appendChild(option.cloneNode(true)); // Re-add matching options
                }
            });
        });
    }

    // Apply filtering to all fields
    filterOptions("state", "stateList");
    filterOptions("country", "countryList");
    filterOptions("tahsil", "tahsilList");
    filterOptions("currentDistrict", "districtList");
    filterOptions("currentVillage", "villageList");
});

function validateForm() {
    let valid = true;

    // Utility function to check if input is empty
    const getValue = id => document.getElementById(id).value.trim();

    // Hide all error messages
    let errorMessages = document.querySelectorAll("small[id$='Error']");
    errorMessages.forEach(function(message) {
        message.style.display = 'none';
    });

    // Validate Current Address
    if (getValue("currentAddress") === "") {
        document.getElementById("currentAddressError").style.display = "block";
        valid = false;
    }

    // Validate Village
    if (getValue("currentVillage") === "") {
        document.getElementById("currentVillageError").style.display = "block";
        valid = false;
    }

    // Validate Tahsil
    if (getValue("tahsil") === "") {
        document.getElementById("tahsilError").style.display = "block";
        valid = false;
    }

    // Validate District
    if (getValue("currentDistrict") === "") {
        document.getElementById("currentDistrictError").style.display = "block";
        valid = false;
    }

    // Validate State
    if (getValue("state") === "") {
        document.getElementById("stateError").style.display = "block";
        valid = false;
    }

    // Validate Pincode
    let pincode = document.getElementById("pincode").value;
    if (pincode < 100000 || pincode > 999999) {
        document.getElementById("pincodeError").style.display = "block";
        valid = false;
    }

    // Validate Country
    if (getValue("country") === "") {
        document.getElementById("countryError").style.display = "block";
        valid = false;
    }

    return valid;
}
</script>
