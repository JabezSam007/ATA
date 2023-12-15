
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="/js1/darkmode-js.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css1/bootstrap.min.css" />
<script type="text/javascript" src="/js1/jquery.min.js"></script>
<script type="text/javascript" src="/js1/popper.min.js"></script>
<script type="text/javascript" src="/js1/bootstrap.min.js"></script>
<title>ATA</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

    body {
        content: '';
        position: fixed;
        width: 100vw;
        height: 100vh;
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        background-color: #f8f8f8; /* Changed background color */
        font-family: Arial, sans-serif; /* Added font-family */
        background-image: url("https://cdn.pixabay.com/photo/2016/06/25/12/48/go-pro-1478810_1280.jpg");
        background-size: cover;
        background-repeat: no-repeat;
    }

.wrapper {
    max-width: 350px;
    min-height: 500px;
    margin: 80px auto;
    padding: 40px 30px 30px 30px;
    background-color: #ecf0f3;
    border-radius: 15px;
    box-shadow: inset 8px 8px 10px rgba(0, 0, 0, 0.5), inset -4px -4px 8px rgba(0, 0, 0, 0.5);
}

.logo {
    width: 80px;
    margin: auto;
}

.logo img {
    width: 100%;
    height: 80px;
    object-fit: cover;
    border-radius: 50%;
    box-shadow: 0px 0px 3px #5f5f5f,
        0px 0px 0px 5px #ecf0f3,
        8px 8px 15px #a7aaa7,
        -8px -8px 15px #fff;
}

.wrapper .name {
    font-weight: 600;
    font-size: 1.4rem;
    letter-spacing: 1.3px;
    padding-left: 10px;
    color: #555;
}

.wrapper .form-field input {
    width: 100%;
    display: block;
    border: none;
    outline: none;
    background: none;
    font-size: 1.2rem;
    color: #666;
    padding: 10px 15px 10px 10px;
}

.wrapper .form-field {
    padding-left: 10px;
    margin-bottom: 20px;
    border-radius: 20px;
    box-shadow: inset 4px 4px 8px rgba(0, 0, 0, 0.5), inset -4px -4px 8px rgba(0, 0, 0, 0.5);
}

.wrapper .form-field .fas {
    color: #555;
}

.wrapper .btn {
    box-shadow: none;
    width: 100%;
    height: 40px;
    background-color: #03A9F4;
    color: #fff;
    border-radius: 25px;
    box-shadow: 3px 3px 3px #b1b1b1,
        -3px -3px 3px #fff;
    letter-spacing: 1.3px;
}

.wrapper .btn:hover {
    background-color: #039BE5;
}

.wrapper a {
    text-decoration: none;
    font-size: 0.8rem;
    color: #03A9F4;
}

.wrapper a:hover {
    color: #039BE5;
}

@media(max-width: 380px) {
    .wrapper {
        margin: 30px 20px;
        padding: 40px 15px 15px 15px;
    }
}

    input:focus {
        outline: none;
        box-shadow: 0 0 0 0 !important;
    }

    .remember {
        color: white;
        margin-left: 25px;
    }

    .remember input {
        width: 20px;
        height: 20px;
        margin-left: 15px;
        margin-right: 5px;
    }

    :focus {
        outline: none;
    }

    .errorblock {
        color: #ff0000;
        margin-left: 100px;
    }
    .navbar {
        background-color: black;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 20px;
        margin: 0;
    }

    .navbar-brand {
        color: #ffffff;
        font-size: 24px;
        margin: 0;
        text-decoration: none;
        border-bottom: none;
    }

    .navbar-nav {
        display: flex;
        margin: 0;
    }

    .nav-item {
        margin-left: 15px;
    }

    .nav-link {
        color: #ffffff;
        text-decoration: none;
        font-size: 16px;
    }
    .heading{
    	margin-left:5.2vw;
    }
</style>
</head>
<body onload="document.form.username.focus()">
    <nav class="navbar">
        <a class="navbar-brand" href="/login">ATA</a>
    </nav>
    
    <div class="wrapper">
    <div class="logo">
        <img src="https://static.vecteezy.com/system/resources/previews/009/468/436/non_2x/bus-traveler-camping-car-illustration-logo-vector.jpg" alt="">
    </div>
    <br>
    <div class="heading text-center mt-4 name">
        REGISTER
    </div>
    <br>
    <form name="form" action="/register" method="POST">
        <div class="form-field d-flex align-items-center">
            <input type="email" name="username" id="username" placeholder="username@gmail.com" required="required" />
        </div>
        <br>
        <div class="form-field d-flex align-items-center">
            <input type="text" name="name" id="name" placeholder="Name" pattern="[a-zA-Z ]+" title="Use only alphabets" required="required" />
        </div>
        <br>
        <div class="form-field d-flex align-items-center">
            <input type="number" name="age" id="age" placeholder="Age" min="18" max="90" title="Minimum age is 18" required="required" />
        </div>
        <br>
        <div class="form-field d-flex align-items-center">
            <input type="tel" name="phone" id="phone" placeholder="Phone" pattern="[0-9]{10}" title="Phone number should be 10 digits" required="required" />
        </div>
        <br>
        <div class="form-field d-flex align-items-center">
            <input type="password" name="password" id="password" placeholder="Password" required="required" title="Enter minimum 8 characters" minlength="8" />
        </div>
        <br>
        <!-- <button class="btn mt-3">SIGN UP</button> -->
        <input type="submit" value="SIGN UP" class="btn mt-3" onclick="return ValidateEmail(document.form.username);" />
    </form>
    </div>

    <script>
        function ValidateEmail(inputText) {
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (inputText.value.match(mailformat)) {
                var user = document.getElementById("username").value;
                var user_domain = user.endsWith(".com");
                var dbuser = document.getElementById("dbuser").value;
                var checkuser = dbuser.includes(user);
                document.form.username.focus();
                if (checkuser) {
                    alert("UserId Already Exists");
                    return false;
                }
                if (user_domain) {
                    return true;
                } else {
                    alert("Email Id should end with .com");
                    return false;
                }
            } else {
                alert("Invalid Email Address!");
                document.form.username.focus();
                return false;
            }
        }
    </script>
</body>
</html>
