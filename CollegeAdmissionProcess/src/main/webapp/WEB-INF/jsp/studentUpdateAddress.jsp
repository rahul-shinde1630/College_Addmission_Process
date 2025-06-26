<%@ page session="true" %>
<jsp:include page="modules/header.jsp"/>

<div class="page-wrapper">
    <div class="page-content">
        <div class="row">
            <div class="col-10 mx-auto">
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="mb-4">Update Address</h5>
                        <form class="row g-3"action="" id="addressForm">
                            <input type="hidden" id="userId" value="${sessionScope.userid}">

                            <div class="col-md-6">
                                <label for="currentAddress" class="form-label">Current Address:</label>
                                <input type="text" class="form-control" id="currentAddress" required>
                            </div>

                            <div class="col-md-4">
                                <label for="currentVillage" class="form-label">Village:</label>
                                <input type="text" class="form-control" id="currentVillage" list="villageList" required>
                            </div>

                            <div class="col-md-4">
                                <label for="tahsil" class="form-label">Tahsil:</label>
                                <input type="text" class="form-control" id="tahsil" list="tahsilList" required>
                                <datalist id="tahsilList">
                                    <option value="Amravati">
                                    <option value="Nagpur">
                                    <option value="Pune">
                                </datalist>
                            </div>

                            <div class="col-md-4">
                                <label for="currentDistrict" class="form-label">District:</label>
                                <input type="text" class="form-control" id="currentDistrict" list="districtList" required>
                                <datalist id="districtList">
                                    <option value="Mumbai">
                                    <option value="Nagpur">
                                </datalist>
                            </div>

                            <div class="col-md-4">
                                <label for="state" class="form-label">State:</label>
                                <input type="text" class="form-control" id="state" list="stateList" required>
                                <datalist id="stateList">
                                    <option value="Maharashtra">
                                    <option value="Tamil Nadu">
                                </datalist>
                            </div>

                            <div class="col-md-4">
                                <label for="pincode" class="form-label">Pincode:</label>
                                <input type="number" class="form-control" id="pincode" required>
                            </div>

                            <div class="col-md-6">
                                <label for="country" class="form-label">Country:</label>
                                <input type="text" class="form-control" id="country" list="countryList" required>
                                <datalist id="countryList">
                                    <option value="India">
                                    <option value="USA">
                                </datalist>
                            </div>

                            <div class="col-md-12 d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary px-4">Save</button>
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

    // GET address by userId
    $.ajax({
        url: '/CollegeAdmissionProcess/getAddressDetails',
        method: 'GET',
        success: function(data) {
            if (data) {
                $('#currentAddress').val(data.currentAddress);
                $('#currentVillage').val(data.currentVillage);
                $('#tahsil').val(data.tahsil);
                $('#currentDistrict').val(data.currentDistrict);
                $('#state').val(data.state);
                $('#pincode').val(data.pincode);
                $('#country').val(data.country);
            }
        },
        error: function() {
            alert("Error loading address details.");
        }
    });

    // Submit form
    $('#addressForm').on('submit', function(e) {
        e.preventDefault();

        const addressData = {
            userid: userId,
            currentAddress: $('#currentAddress').val(),
            currentVillage: $('#currentVillage').val(),
            tahsil: $('#tahsil').val(),
            currentDistrict: $('#currentDistrict').val(),
            state: $('#state').val(),
            pincode: $('#pincode').val(),
            country: $('#country').val()
        };

        $.ajax({
            url: '/CollegeAdmissionProcess/updateAddressByUserId',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(addressData),
            success: function(response) {
                if (response === "success") {
                    alert("Address updated!");
                    window.location.href = "studentUpdateAddress"; // or keep user on same page
                } else {
                    alert("Failed to update address.");
                }
            },
            error: function() {
                alert("Server error.");
            }
        });
    });
});
</script>
