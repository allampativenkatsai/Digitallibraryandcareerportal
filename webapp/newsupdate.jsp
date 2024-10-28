<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.time.LocalDate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add News</title>
    <style>
        /* Full background with overlay */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/news2.png') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow: hidden;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
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

        /* Centered form card */
        .form-container {
            position: relative;
            z-index: 2;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px 30px;
            width: 90%;
            max-width: 400px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .form-container h2 {
            font-size: 1.8em;
            margin-bottom: 15px;
            color: #2aaee3;
        }

        .form-container label {
            font-size: 1em;
            display: block;
            margin-top: 10px;
            color: #080808;
            text-align: left;
        }

        .form-container input[type="text"],
        .form-container input[type="date"],
        .form-container textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
            background-color: #fff;
        }

        .form-container button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1em;
            background-color: #1587b8;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

<% 
    LocalDate date = LocalDate.now(); 
%>
<div class="form-container">
    <h2>Add News</h2>
   <form action="newsinsert.jsp" method="post">
        <label for="newsText">News Text:</label>
        <textarea id="newsText" name="news" rows="7" placeholder="Enter news content here" required></textarea>

        <label for="newsDate">Date:</label>
        <input type="date" id="date" name="date" value="<%= date %>" readonly>

        <button type="submit">Add News</button>
    </form>
</div>

</body>
</html>




