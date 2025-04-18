function registrationvalid() {
    if (document.Registration_form.firstName.value == "") {
        alert("Please enter your first name");
        return false;
    }
    else if (document.Registration_form.middleName.value == "") {
        alert("Please enter your middle name");
        return false;
    }
    else if(document.Registration_form.lastName.value == ""){
        alert("Please enter your last name");
        return false;
    }
    else if(document.Registration_form.gender.value == ""){
        alert("Please select your gender");
        return false;
    }
    else if (document.Registration_form.email.value == "") {
        alert("Please enter your email");
        return false;
    }
    else if (document.Registration_form.contactnumber.value == "") {
        alert("Please enter your contact number");
        return false;
    }
    else if (document.Registration_form.contactnumber.value.length !== 10) {
        alert("Please enter a valid 10-digit contact number");
        return false;
    }
    else if (document.Registration_form.password.value == "") {
        alert("Please enter your password");
        return false;
    }
    else if (document.Registration_form.password.value.length < 8) {
        alert("Password should be minimum 8 characters long");
        return false;
    }
    else if (document.Registration_form.Courselist.value == "") {
        alert("Please select your course");
        return false;
    }
    else{
        return true;
    }
}
document.getElementById("studentId").value = Math.floor(1000000 + Math.random() * 9000000);
// function showError(message) {
//     const errorDiv = document.getElementById('error');
//     errorDiv.textContent = message;
//     errorDiv.style.display = 'block';
// }