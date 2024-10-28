<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - College Library</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8d1d8; /* Light pink background for the body */
            margin: 0;
            padding: 20px;
            color: #333; /* Darker text color for visibility */
        }
        .container {
            max-width: 400px; /* Reduced width of the container */
            margin: 50px auto; /* Increased top margin for lower positioning */
            background: linear-gradient(to bottom right, rgba(255, 255, 255, 0.9), rgba(255, 192, 203, 0.9)); /* Gradient background */
            padding: 20px;
            border-radius: 12px; /* Rounded corners */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Soft shadow for depth */
            transition: transform 0.2s; /* Animation on hover */
        }
        .container:hover {
            transform: scale(1.02); /* Slightly enlarge on hover */
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #d81b60; /* Vibrant text color */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 8px; /* Reduced padding for less space */
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            color: #d81b60; /* Header text color */
            font-weight: bold; /* Bold header text */
        }
        tr:hover {
            background-color: rgba(255, 192, 203, 0.5); /* Light pink highlight on row hover */
        }
        .submit-btn {
            display: block;
            width: 79px; /* Width of the button */
            margin: 20px auto; /* Center button horizontally */
            padding: 8px;
            background-color: #d81b60; /* Button background color */
            color: white; /* Button text color */
            border: none;
            border-radius: 5px; /* Rounded button corners */
            cursor: pointer;
            font-size: 16px; /* Increased font size */
            transition: background-color 0.3s; /* Transition for hover effect */
        }
        .submit-btn:hover {
            background-color: #c61b50; /* Darker shade on hover */
        }
        
    </style>
</head>
<body>

    <div class="container">
        <h1>User Profile</h1>
        <table>
            <tr>
                <th><i class="fas fa-user"></i> Name</th>
                <td><%=session.getAttribute("name") %></td>
            </tr>
            <tr>
                <th><i class="fas fa-envelope"></i> Email</th>
                <td><%=session.getAttribute("email") %></td> <!-- Replace with actual email -->
            </tr>
            <tr>
                <th><i class="fas fa-id-card"></i> Roll No</th> <!-- Added Roll No row -->
                <td><%=session.getAttribute("rollno") %></td> <!-- Replace with actual Roll No -->
            </tr>
            <tr>
                <th><i class="fas fa-graduation-cap"></i> Branch</th>
                <td><%=session.getAttribute("branch") %></td>
            </tr>
            <tr>
                <th><i class="fas fa-phone"></i> Ph Num</th>
                <td><%=session.getAttribute("phnum") %></td>
            </tr>
            
        </table>
        <%String user = (String)session.getAttribute("user");
        String ram = null;
        if("admin".equals(user)){
        	 ram = "homeadmin.jsp";
        }else{
        	ram="home.jsp";
        }
        	%>
        
       <button class="submit-btn" onclick="location.href='<%= ram%>';"> Home</button> 
    </div>

</body>
</html>







			
			
</body>
</html>