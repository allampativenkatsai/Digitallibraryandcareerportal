<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Internship Details</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: url('backhome6.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            color: #fff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1;
        }

        .form-container {
            position: relative;
            z-index: 2;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 30px;  /* Decreased padding */
            width: 90%;
            max-width: 450px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
            transition: transform 0.2s ease;
        }

        h1 {
            color: #007bff;  /* Changed heading color for vibrancy */
            text-align: center;
            margin-bottom: 15px;
            font-size: 24px; /* Increased font size for visibility */
        }

        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc; /* Lighter border */
            border-radius: 10px;  /* More rounded corners */
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        input[type="text"]:focus, textarea:focus {
            border-color: #007bff; /* Highlight border on focus */
            outline: none;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 10px; /* More rounded button */
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>

<div class="overlay"></div>

<% 
    String name = (String)session.getAttribute("name");
    String rollno = (String)session.getAttribute("rollno");
%>

<div class="form-container">
    <h1>Add Internship Details</h1>
    <form action="inupdate.jsp" method="post">
        <label for="companyName">Company Name:</label>
        <input type="text" id="companyName" name="comname" placeholder="Enter company name" required>

        <label for="description">Description:</label>
        <textarea id="description" name="descr" rows="5" placeholder="Enter internship description" required></textarea>

        <input type="hidden" name="name" value="<%= name %>">
        <input type="hidden" name="rollno" value="<%= rollno %>">
        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
