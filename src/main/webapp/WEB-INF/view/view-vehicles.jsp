<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>Vehicle Search</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/js1/font.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
    <style>
        .container {
            margin-top: 50px;
        }
      	body{
      		background-image: url("https://cdn.pixabay.com/photo/2021/01/05/06/40/boat-5889919_1280.png");
        	background-size: cover;
        	background-repeat: no-repeat;
      	}
    </style>
</head>
<body>
                <%
                // Clear browser cache
           		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
           		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
           		response.setHeader("Expires", "0"); // Proxies.

           		if (session.getAttribute("user")  == null ){
           		%>
           		<c:redirect url = "/login"/>
           		<%
           		}
           		%>
<div class="container text-white">
    <jsp:include page="Header.jsp"></jsp:include>
    <br>
    <h3 class="text-center" style="font-family: Arial;">AVAILABLE VEHICLES</h3>
    <table class="table table-striped table-bordered text-white">
        <thead>
        <tr>
            <th>Type</th>
            <th>Travels Name</th>
            <th>Brand</th>
            <th>Driver</th>
            <th>Plate No</th>
            <th>Travel Date</th>
            <th>Source - Destination</th>
            <th>Price</th>
            <th>Book</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vehicleList}" var="vehicle">
            <tr class="vehicle">
                <td>${vehicle.type}</td>
                <td>${vehicle.travelsName}</td>
                <td>${vehicle.brand}</td>
                <td>${vehicle.driver}</td>
                <td>${vehicle.plateNo}</td>
                <td>${vehicle.travelDate}</td>
                <td>${vehicle.route}</td>
                <td>${vehicle.price}</td>
                <td style="color: green" class="text-center"><a
                        href="/passenger/book/vehicle?vehicleId=${vehicle.id}">
                    <i class="fas fa-taxi"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
