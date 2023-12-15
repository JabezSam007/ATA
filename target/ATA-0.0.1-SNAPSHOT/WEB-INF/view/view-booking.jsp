<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking List</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/js1/font.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
    
    <style>
    
    body{
      		background-image: url("https://cdn.pixabay.com/photo/2020/03/01/00/55/compass-4891499_1280.jpg");
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
<div class="container">
    <jsp:include page="Header.jsp"></jsp:include>
    <br><br><br>
    <h3 class="text-center text-white" style="font-family: Arial;">BOOKINGS</h3>
    <table class="table table-striped table-bordered text-white">
        <thead>
        <tr>
            <th>Date of Travel</th>
            <th>Passenger</th>
            <th>Email</th>
            <th>Travel Route</th>
            <th>Vehicle No</th>
            <th>Status</th>
            <th>Amount</th>
            <th>Cancel</th>
            <th>Receipt</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="booking" items="${bookings}">
            <tr>
                <td>${booking.bookingDate}</td>
                <td>${booking.passenger}</td>
                <td>${booking.bookedBy}</td>
                <td>${booking.route}</td>
                <td>${booking.vehicle.plateNo}</td>
                <td>${booking.status}</td>
                <td>${booking.vehicle.price}</td>
                <td style="color: green" class="text-center"><a
                        href="/passenger/cancel/booking?bookingId=${booking.id}">
                    <i class="fas fa-ban"></i></a></td>
                <td style="color: green" class="text-center"><a
                        href="/passenger/booking/receipt?bookingId=${booking.id}">
                    <i class="fas fa-file-export"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

