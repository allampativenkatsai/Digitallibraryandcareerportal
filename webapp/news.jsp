<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.connect.NewsCrud,java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Latest News</title>
    <style>
        /* Full background with overlay */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/news3.png') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow: hidden; /* Prevent scrolling */
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align items to the top */
            height: 100vh;
        }

        /* Overlay that covers the entire background */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Full background overlay */
            z-index: 1;
        }

        /* Centered news card */
        .news-card {
            position: relative;
            z-index: 2; /* Ensure the card is above the overlay */
            max-width: 550px;
            padding: 20px;
            background-color: #fff;
            border-radius: 20px 50px 20px 50px; /* Unconventional card shape */
            margin: 50px auto; /* Adjusted margin to center it horizontally */
            margin-top: 100px; /* Add margin to push it down from the top */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: justify; /* Justify text in the card */
            color: #222;
        }

        .news-card h2 {
            font-size: 24px;
            color: #3eb4eb; /* Dark blue for title */
            margin: 0;
            text-align: center;
        }

        .news-card p {
            font-size: 16px;
            margin: 10px 0 20px;
            line-height: 1.5;
        }

        .news-card .author {
            font-size: 14px;
            color: #777;
            font-style: italic;
            text-align: right; /* Align author text to the right */
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .news-card {
                max-width: 300px;
                padding: 15px;
            }
            .news-card h2 {
                font-size: 20px;
            }
            .news-card p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<!-- News Card -->
<div class="news-card">

<% 
    NewsCrud n = new NewsCrud();
    List<String> list = n.read();

    if (!list.isEmpty()) {
%>
    <h2>Latest News</h2>
  <% for (String point : list) {
    %><p><%=point %></p>
    <% 
        } }
    else{
    	%> <p>No news available.</p><%
    }
    
%>
    <div class="author">By Admin</div>
</div>

</body>
</html>














