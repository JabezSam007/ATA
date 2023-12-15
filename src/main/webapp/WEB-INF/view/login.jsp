<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>ATA</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<style>
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
        background-image: url("https://cdn.pixabay.com/photo/2016/07/30/00/03/winding-road-1556177_1280.jpg");
        background-size: cover;
        background-repeat: no-repeat;
    }

<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<title>ATA</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
        background-image: url("https://cdn.pixabay.com/photo/2016/07/30/00/03/winding-road-1556177_1280.jpg");
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
    /* border: 1px solid red; */
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
    	margin-left:8.7vw;
    }
    .form-field1{
    	margin-bottom:1vw;
    	margin-left:8vw;
    	color:red;
    }
</style>
</head>
<body onload="document.form.username.focus()" style="margin: 0;">
   <nav class="navbar" style="margin-top: 0;">
        <a class="navbar-brand" href="/login">ATA</a>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/registration">REGISTER</a>
            </li>
        </ul>
    </nav>
	    
    <div class="wrapper">
    <%-- Display error message if present --%>
<c:if test="${not empty error}">
    <div class="form-field1">
        <div class="error-message">${error}</div>
    </div>
</c:if>
    <div class="logo">
        <img src="https://static.vecteezy.com/system/resources/previews/009/468/436/non_2x/bus-traveler-camping-car-illustration-logo-vector.jpg" alt="">
    </div>
    <br>
    <div class="heading text-center mt-4 name">
        LOGIN
    </div>
    <br>
    <form name='loginForm' action="/login" method='POST' modelAttribute="user" class="login-form">
        <div class="form-field d-flex align-items-center">
            <input type="text" name='username' class="form-control" placeholder="Email">
        </div>
        <br>
        <div class="form-field d-flex align-items-center">
            <input type="password" name='password' class="form-control" placeholder="Password">
        </div>
        <br>
        <button class="btn mt-3">Login</button>
    </form>
    <br>
    <div class=" heading text-center fs-6">
        <a href="/forgetPassword">Forget password?</a>
    </div>
</div>
</body>
</html>

