<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.model.Skills,com.sai.connect.SkillsCrud,java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skills and Roadmap</title>
    <style>
        /* Full background with overlay */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/backhome6.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow: hidden;
            color: #fff;
            height: 100vh; /* Full viewport height */
            display: flex;
            flex-direction: column;
        }

        /* Entire page overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: 1;
        }

        /* Main content container styling */
        .container {
            position: relative;
            z-index: 2; /* Ensure content is above overlay */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            color: #fff;
            overflow-y: auto; /* Enable vertical scrolling */
            height: 100%; /* Allow full height for scrolling */
        }

        /* Header styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            max-width: 1200px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            color: #333;
        }

        .header h1 {
            color: #004080;
            margin: 0;
            font-size: 28px;
        }

        /* Main section styling */
        .main {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 40px 20px;
            max-width: 1200px;
        }

        /* Resource section cards */
        .resource-card {
            background-color: #fff;
            padding: 20px;
          max-width: 600px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            color: #222;
            transition: transform 0.3s ease;
            position: relative; /* For absolute positioning of posted by */
        }

        .resource-card:hover {
            transform: translateY(-10px); /* Lift effect on hover */
        }

        .resource-card h3 {
            color: #004080;
            font-size: 20px;
            margin-top: 0;
        }

        .resource-card p {
            font-size: 16px;
            line-height: 1.5;
        }

        /* Add Button */
        .add-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #3eb4eb;
            color: #fff;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            font-size: 36px;
            text-align: center;
            line-height: 60px; /* Center the '+' symbol */
            cursor: pointer;
            z-index: 2; /* Above overlay */
        }

        /* Posted by text */
        .posted-by {
            position: absolute;
            bottom: 10px;
            right: 10px;
            font-size: 12px;
            color: #666;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main {
                flex-direction: column;
                align-items: center;
            }
            .resource-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<!-- Overlay covering the entire background -->
<div class="overlay"></div>

<!-- Main content container -->
<div class="container">

<%
SkillsCrud p = new SkillsCrud();
ArrayList<Skills> list =p.read();
if(list!=null && !list.isEmpty()){
%>
    <!-- Header -->
    <div class="header">
        <h1>Skills</h1>
    </div>
<%for(Skills k : list){ %>
    <!-- Main Content -->
    <div class="main">
        <!-- Embedded Systems Card -->
        <div class="resource-card">
            <h3><%=k.getSname() %></h3>
            <p><%=k.getRoadmap() %></p>
            
            <div class="posted-by">Posted by:<%=k.getRollno() %></div>
        </div>

       <%

}
}
	%> 
    </div>
</div>

<!-- Add Resource Button -->
<a href="skinsert.jsp"><button class="add-button">+</button></a>

</body>
</html>








</body>
</html>