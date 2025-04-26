function TeacherRegistrationvalid() {
    let randomNumber = Math.floor(10000 + Math.random() * 90000); // Random 5-digit number
    let teacherId = "TR" + randomNumber;
    document.getElementById('TeacherId').value = teacherId;
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
    else if(document.Registration_form.gender.value == "") {
        alert("Please enter your Gender");
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
    else if (document.Registration_form.Faculty.value == "") {
        alert("Please select your Faculty");
        return false;
    }
    else if (document.Registration_form.TeachingYear.value == "") {
        alert("Please select your Teaching Year");
        return false;
    }
    else{
        return true;
    }
}
window.onload = function() {
    TeacherRegistrationvalid();
}