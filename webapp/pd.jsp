<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Addexper</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('images/place.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
        }

        header {
            text-align: center;
            margin: 20px 0;
        }

        h1 {
            color: #4fcdff;
            font-size: 2em;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px; /* Rounded corners for the container */
            padding: 20px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 600px;
            margin: 20px 0;
            position: relative; /* Position relative for pseudo-elements */
            overflow: hidden; /* Hide overflow to create a mask effect */
        }

        /* Creating a wave shape effect */
        .form-container::before {
            content: '';
            position: absolute;
            top: -40px; /* Adjust positioning */
            left: 0;
            width: 100%;
            height: 60px;
            background: rgba(79, 205, 255, 0.8); /* Light blue wave */
            border-radius: 50%; /* Circular ends for the wave */
            transform: rotate(180deg); /* Flip the wave */
            z-index: 0; /* Place behind the content */
        }

        .form-container form {
            position: relative; /* Make form relative for proper layering */
            z-index: 1; /* Place form above the background */
        }

        textarea {
            width: 100%;
            margin-top: 15px;
            padding: 15px; /* Increased padding for better appearance */
            border: 2px solid #4fcdff; /* Blue border */
            border-radius: 10px; /* Rounded corners for textarea */
            box-sizing: border-box;
            resize: none; /* Prevent resizing */
            font-size: 1em; /* Increase font size */
            font-family: 'Arial', sans-serif; /* Font family for textarea */
            transition: border-color 0.3s ease; /* Smooth transition */
        }

        textarea:focus {
            outline: none; /* Remove default outline */
            border-color: #3ab0e3; /* Change border color on focus */
        }

        button.submit {
            background-color: #4fcdff;
            color: white;
            border: none;
            border-radius: 5px; /* Rounded corners for button */
            padding: 10px;
            cursor: pointer;
            width: 150px; /* Set a fixed width for the button */
            margin-top: 15px; /* Margin above the button */
            display: block; /* Center the button */
            margin-left: auto; /* Centering the button */
            margin-right: auto; /* Centering the button */
            transition: background-color 0.3s ease; /* Smooth transition */
        }

        button.submit:hover {
            background-color: #3ab0e3; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <header>
        <h1>Add Experience</h1>
    </header>
<%String rollno = (String)session.getAttribute("rollno");
String name = (String)session.getAttribute("name");
%>
    <div class="form-container">
      <form action="placeadd.jsp"  method="post">
            <textarea rows="6" placeholder="Share your experience..." name="text" required></textarea>
            <input name="rollno" type="hidden" value="<%=rollno%>">
            <input  name="name" type="hidden" value="<%=name%>">
            <button type="submit" class="submit">Add Experience</button>
        </form>
    </div>
</body>
</html>
