<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.model.Resources,com.sai.connect.ResourcesCrud,java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Library Resources</title>
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
            height: 100vh;
            color: #fff;
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

        .header nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #004080;
            font-weight: bold;
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
            width: 300px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
            color: #222;
            transition: transform 0.3s ease;
            position: relative; /* Added to position "Posted by" */
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

        .resource-card a {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #3eb4eb;
            color: #fff;
            border-radius: 20px;
            text-decoration: none;
        }

        .resource-card a:hover {
            background-color: #004080;
        }

        /* Posted by styling */
        .posted-by {
            position: absolute;
            bottom: 10px; /* Position at the bottom */
            right: 10px; /* Position to the right */
            font-size: 12px;
            color: #777;
        }

        /* Add resource button styling */
        .add-resource {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 24px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            z-index: 3; /* Ensure it is above the overlay */
            text-align: center; /* Center text */
            line-height: 50px; /* Center text vertically */
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
<%
ResourcesCrud p = new ResourcesCrud();
ArrayList<Resources> list =p.read();
if(list!=null && !list.isEmpty()){
	%>
<!-- Main content container -->
<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>College Library Resources</h1>
        <nav>
            <a href="#gov-resources">Gov. Resources</a>
            <a href="#skills">Skills</a>
            <a href="#jobs">Jobs</a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main">
    
<%
for(Resources k : list){%>
        <!-- Government Resources Card -->
        
        <!-- Skills Development Card -->
        <div class="resource-card" id="skills">
            <h3><%=k.getType()%></h3>
            <p>Boost your skills with resources for GATE preparation, coding platforms, and more.</p>
            <a href="<%=k.getUrl() %>" target="_blank">Get Started</a>
            <div class="posted-by">Posted by:<%=k.getRollno() %></div>
        </div>

        <%
	
	
}
}
	%> <!-- Job Opportunities Card -->
        
    </div>
</div>

<!-- Add Resource Button -->
<a href="resoinsert.jsp" class="add-resource">+</a>

</body>
</html>

