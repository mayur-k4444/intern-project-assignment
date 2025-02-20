function registrationvalid() {
    const errorDiv = document.getElementById('error');
    
    // Reset error message
    errorDiv.style.display = 'none';
    errorDiv.textContent = '';

    // First Name validation
    if (document.Registration_form.firstName.value.trim() === "") {
        showError("Please enter your first name");
        return false;
    }

    // Middle Name validation
    if (document.Registration_form.middleName.value.trim() === "") {
        showError("Please enter your middle name");
        return false;
    }

    // Last Name validation
    if (document.Registration_form.lastName.value.trim() === "") {
        showError("Please enter your last name");
        return false;
    }

    // Gender validation
    if (document.Registration_form.gender.value === "disabled") {
        showError("Please select your gender");
        return false;
    }

    // Email validation
    const email = document.Registration_form.email.value;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email || !emailPattern.test(email)) {
        showError("Please enter a valid email address");
        return false;
    }

    // Contact validation
    if (!document.Registration_form.contact_number.value) {
        showError("Please enter your contact number");
        return false;
    }

    // Student ID validation
    if (!document.Registration_form.studentId.value) {
        showError("Please enter your student ID");
        return false;
    }

    // Password validation
    const password = document.Registration_form.password.value;
    if (password.length < 8) {
        showError("Password must be at least 8 characters long");
        return false;
    }

    // Course validation
    if (document.Registration_form.Course_list.value === "") {
        showError("Please select your course");
        return false;
    }

    return true;
}

function showError(message) {
    const errorDiv = document.getElementById('error');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
}