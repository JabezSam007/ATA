<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
    <title>Terminals</title>
    <link rel="stylesheet" type="text/css" href="/css/toastr.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <script src="/js/toastr.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>

    <script type="text/javascript" src="/js1/darkmode-js.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <script type="text/javascript" src="/js1/jquery.min.js"></script>
    <script type="text/javascript" src="/js1/popper.min.js"></script>
    <script type="text/javascript" src="/js1/bootstrap.min.js"></script>
</head>
<body>
<form action="/upload-Image" method="post" enctype="multipart/form-data">
    <nav class="navbar navbar-expand-md fixed-top navbar-dark" style="background-color: black;">
        <a href="" class="navbar-brand">ATA</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="/passenger/vehicle/all" class="nav-link">Vehicles</a>
                </li>
                <li class="nav-item">
                    <a href="/passenger/status" class="nav-link">Bookings</a>
                </li>
                <li class="nav-item">
                    <a href="/logout" class="nav-link">Log Out</a>
                </li>
            </ul>
        </div>
    </nav>
</form>
</body>


</html>