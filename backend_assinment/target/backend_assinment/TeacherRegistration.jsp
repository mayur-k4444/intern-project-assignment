<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher registration</title>
    <link rel="stylesheet" href="registrationstyle.css">
</head>
<body>
    <div class="container">
        <h1>Teacher Registration</h1>
        <form action="TeacherRegistrationin" method="post" name="Registration_form" onsubmit="return TeacherRegistrationvalid()"> 
            <div class="input-group">
                <label for="firstName">Teacher Name</label>
                <div class="name-fields">
                    <input type="text" id="firstName" placeholder="First Name" name="firstName">
                    <input type="text" id="middleName" placeholder="Middle Name" name="middleName">
                    <input type="text" id="lastName" placeholder="Last Name" name="lastName">
                </div>
            </div>
            <div class="input-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender">
                    <option value="disabled" disabled selected>Please Select</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="input-group">
                <label for="email">Teacher E-mail</label>
                <input type="email" id="email" placeholder="ex: myname@example.com" name="email">
            </div>
            <div class="input-group">
                <label for="contact">Contact Number</label>
                <input type="tel" id="contact" name="contactnumber">
            </div>
            <div class="input-group" style="display: none;"> 
                <label for="TeacherId">Teacher ID</label>
                <input type="text" id="TeacherId" name="TeacherId" value="">
            </div>
            <div class="input-group">
                <label for="password">Create Password</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="input-group">
                <label for="Faculty">Teacher Faculty</label>
                <select id="Faculty" name="Faculty">
                    <option value="" disabled selected>Please Select</option>
                    <option value="Bsc">Bsc</option>
                    <option value="BscIT">BscIT</option>
                </select>
            </div>
            <button type="submit" name="submit">Submit</button>
            <a href="TeacherLogin.jsp" class="login-link">Already have an account? Login</a>
            <!-- <div id="error" class="error-message" name="error"></div> -->
        </form>
    </div>
    <script src="TeacherRegistration.js"></script>
</body>
</html>