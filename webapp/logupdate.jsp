<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logbook</title>
 <style>
        /* Full-page styling with no scrolling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            height: 100vh; /* Full page height */
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('images/backhome6.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow: hidden; /* Disable scrolling */
        }
        
        /* Full-page overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.2); /* Dark semi-transparent overlay */
            z-index: 1;
        }

        /* Form container styling */
        .form-container {
            position: relative;
            z-index: 2;
            padding: 30px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #000;
            text-align: center;
        }

        h2 {
            color: #0ee40e; /* Green text for heading */
            margin-bottom: 10px;
        }

        /* Table and form styling */
        table {
            width: 100%;
            margin-bottom: 20px;
        }
        td {
            padding: 10px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #fff; /* White color for labels */
        }
        input[type="text"],
        input[type="date"] { /* Include both text and date input styles */
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff; /* White background */
            color: #000;
            -webkit-appearance: none; /* Remove default styling in WebKit browsers */
            -moz-appearance: none; /* Remove default styling in Firefox */
            appearance: none; /* Remove default styling */
        }
        /* Submit button styling */
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            width: 150px; /* Decreased width */
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <!-- Background overlay -->
    <div class="overlay"></div>
    
    <!-- Form container -->
    <div class="form-container">
        <h2>Book Entry</h2>
        <form action="logupread.jsp" method="get" >
            <table>
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><input type="text" name="name" value="<%=request.getParameter("name") %>"></td>
                </tr>
                <tr>
                    <td><label for="rollno">Roll No:</label></td>
                    <td><input type="text" name="rollno" value="<%=request.getParameter("rollno") %>"></td>
                </tr>
                <tr>
                    <td><label for="branch">Branch:</label></td>
                    <td><input type="text" name="rollno" value="<%=request.getParameter("branch") %>"></td>
                </tr>
                <tr>
                    <td><label for="title">Title:</label></td>
                    <td><input type="text" name="title" value="<%=request.getParameter("title") %>"></td>
                </tr>
                <tr>
                    <td><label for="taken">Taken Date:</label></td>
                    <td><input type="text" name="taken" value="<%=request.getParameter("taken") %>"></td>
                </tr>
                <tr>
                    <td><label for="receive">Receive Date:</label></td>
                    <td><input type="date" id="receive" name="receive" placeholder="Date to receive"></td>
                </tr>
            </table>
            <input type="submit" value="update Book">
        </form>
    </div>
</body>
</html>



