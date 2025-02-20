function loginalert(){
    if (document.Login_form.studentId.value==""){
        document.getElementById("error").innerHTML="Fill out the StudentId"
        // alert("Fill out the StudentId")
        return false;
    }
    else if(document.Login_form.password.value==""){
        document.getElementById("error").innerHTML="Fill out the Password"
        return false;
    }
    else{
        return true
    }
}