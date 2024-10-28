<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.connect.ExamPdfCrud,com.sai.model.ExamPdf,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exampdf</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url('images/backhome6.jpg'); /* Replace with your background image */
            background-size: cover;
            background-position: center;
            position: relative;
            height: 100vh; /* Ensure the body covers the full viewport height */
            overflow: auto; /* Prevent scrollbars */
        }

        /* Black overlay for the entire page */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.35); /* Light black overlay */
            z-index: -1; /* Ensures the overlay stays below the content but above the background */
        }

        .container {
            position: relative; /* Positioning the content relative */
              /* Ensures content is above the overlay */
            margin-top: px;
        }

        h2 {
            text-align: center;
            margin-top: px;
            color: white;
            font-family: 'Poppins', sans-serif;
            letter-spacing: 1px;
        }

        /* Styling for the cards */
        .card {
            margin: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 15px; /* Smooth rounded corners */
            width: 90%; /* Adjusted width */
            background-color: rgba(255, 255, 255, 0.3); /* Transparent background */
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3); /* Softer shadow on hover */
        }

        .card-title {
            font-size: 1.4rem; /* Larger title */
            color:  #FFD700; /* Gold color */
            text-align: center;
            font-family: 'Montserrat', sans-serif; /* Elegant font for title */
        }

        .card-subtitle {
            font-size: 1.2rem;
            color: white; /* Strong white for author */
            text-align: center;
            margin-top: 5px;
            font-family: 'Open Sans', sans-serif;
        }

        .card-text {
            font-size: 1rem;
            color: white; /* Strong white for availability */
            text-align: center;
        }

        .no-books {
            text-align: center;
            color: white;
            font-size: 18px;
            margin-top: 50px;
        }

        /* Button styling */
        .add-button {
            position: absolute;
            top: 10px;
            right: 20px;
            padding: 10px 20px;
            background-color: #46a7c7;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .add-button:hover {
            background-color: #46a7c7;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .card {
                width: 100%;
                margin-bottom: 20px;
            }

            .add-button {
                top: 10px;
                right: 10px;
            }
            .h2{
             top: 20px;
            }
        }
    </style>
</head>
<body>

<%
String branch = request.getParameter("branch");
ExamPdfCrud p = new ExamPdfCrud();
ArrayList<ExamPdf> a = p.read(branch);

%>

<div class="container">
    <h2>ACADEMIC PDFs</h2>
 <a href="adde.html" class="add-button">Add Academics</a>
    <% if (a != null && !a.isEmpty()) { %>
        <div class="row" id="book-list">
            <% 
        		for (ExamPdf g : a) {
        			if ("yes".equals(g.getApporve())) 
        			{ %>
                    <div class="col-md-4 d-flex justify-content-center">
                        <div class="card">
                            <div class="card-body text-center">
                                <a class="card-title" href="<%= g.getUrl() %>" target="_blank">
                                    <%= g.getTitle() %>
                                </a>
                                <h5 class="card-subtitle mb-2"><%= g.getSem() %></h5>
                                <p class="card-text"><%=g.getDescription()%></p>
                            </div>
                        </div>
                    </div>
            <% } } %>
        </div>
    <% } else { %>
        <div class="no-books" id="no-books-message">
            <p>No Academic books available for this branch.</p>
        </div>
    <% } %>

</div>

</body>
</html>








