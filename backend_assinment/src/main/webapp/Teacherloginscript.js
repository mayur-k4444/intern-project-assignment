function loginalert() {
    if (document.Login_form.TeacherId.value == "") {
        alert("Please enter your Teacher ID");
        return false;
    }
    else if (document.Login_form.password.value == "") {
        alert("Please enter your password");
        return false;
    }
    else{
        return true;
    }
}