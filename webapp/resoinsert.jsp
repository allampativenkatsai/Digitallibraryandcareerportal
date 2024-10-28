<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resource Entry</title>
    <style>
        /* Reset default styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(120deg, #8e1f7a, #400f84); /* Softer gradient */
            font-family: 'Arial', sans-serif;
            color: #333;
            overflow: hidden;
        }

        /* Overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3); /* Light overlay */
            z-index: 1;
        }

        /* Container styling */
        .form-container {
            position: relative;
            z-index: 2;
            padding: 40px;
            width: 400px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        /* Header with gradient text */
        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .logo {
            max-width: 45px;
            height: auto;
        }

        h2 {
            margin-left: 10px;
            font-size: 24px;
            font-weight: bold;
            background: -webkit-linear-gradient(#6c63ff, #9a57d3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Table styling */
        table {
            width: 100%;
            margin-bottom: 20px;
            color: #333;
        }
        
        td {
            padding: 10px 0;
            vertical-align: middle;
        }
        
        label {
            display: block;
            font-weight: bold;
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="url"] {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #fafafa;
            color: #333;
            transition: border 0.3s;
            font-size: 14px;
        }
        
        input[type="text"]:focus,
        input[type="url"]:focus {
            border-color: #6c63ff;
            outline: none;
        }

        /* Submit button styling */
        input[type="submit"] {
            background: linear-gradient(120deg, #6c63ff, #9a57d3);
            color: white;
            padding: 12px 0;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition:  0.3s;
        }
        
        input[type="submit"]:hover {
            background: linear-gradient(120deg, #5a54d2, #8450ba);
        }
    </style>
</head>
<body>

<%String name = (String)session.getAttribute("name");
String rollno = (String)session.getAttribute("rollno");
%>
    <!-- Background overlay -->
    <div class="overlay"></div>
    
    <!-- Form container -->
    <div class="form-container">
        <div class="header">
            <img src="images/okback.png" alt="Logo" class="logo">
            <h2>Add Resource</h2>
        </div>
       <form action="resourceupdate.jsp" method="post">
            <table>
                <tr>
                    <td><label for="type">Resource Type:</label></td>
                    <td><input type="text" id="type" name="type" placeholder="e.g., Book, PDF, Website"></td>
                </tr>
                <tr>
                    <td><label for="url">URL:</label></td>
                    <td><input type="url" id="url" name="url" placeholder="https://example.com"></td>
                </tr>
                
<input type="hidden" name="name" value="<%=name %>">
<input type="hidden" name="rollno" value="<%=rollno %>">
            </table>
            <input type="submit" value="Add Resource">
        </form>
    </div>
</body>
</html>





