<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            display: flex;
            /* justify-content: center; */
            align-items: center;
            height: 100vh;
            margin-left:2vw;
            margin-top:12vw;
        }

        .card {
            max-width: 500px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: #fff;
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .card-text {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .btn-primary {
            display: block;
            margin-top: 30px;
            width: 100%;
        }
        
         body{
      		background-image: url("https://cdn.pixabay.com/photo/2019/07/08/19/17/hot-air-balloon-4325398_1280.jpg");
        	background-size: cover;
        	background-repeat: no-repeat;
      	}
    </style>
</head>
<body>
    <jsp:include page="Header.jsp" />

    <div class="container">
        <div class="card">
            <div class="card-title">Payment Success</div>
            <div class="card-text">Thank you for your payment!</div>
            <div class="card-text">Your payment has been successfully processed.</div>
            <div class="card-text">Booking ID: ${bookingId}</div>
            <div class="card-text">For any inquiries, please contact our support team.</div>
            <form:form name="form" action="${pageContext.request.contextPath}/passenger/status" modelAttribute="bookingId">
            </form:form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
