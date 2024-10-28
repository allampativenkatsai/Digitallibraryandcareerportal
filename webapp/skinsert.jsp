<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Skill Roadmap</title>
    <style>
        /* Full background with overlay */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: url('images/backhome6.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        /* Overlay to darken background image */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        /* Compact form container with reduced width */
        .form-container {
            position: relative;
            z-index: 2;
            background: linear-gradient(145deg, #ffffff, #f0f0f0);
            border-radius: 15px;
            padding: 25px;
            width: 90%;
            max-width: 350px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            transform: scale(1);
            transition: transform 0.3s ease;
            text-align: center;
        }

        .form-container:hover {
            transform: scale(1.02);
        }

        /* Gradient line for visual interest */
        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        h1 {
            color: #333;
            font-size: 22px;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }

        .form-group {
            width: 100%;
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            font-size: 15px;
            color: #333;
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input, textarea {
            width: calc(100% - 10px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
            background-color: #f9f9f9;
            transition: box-shadow 0.2s ease;
        }

        input:focus, textarea:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(42, 157, 143, 0.3);
        }

        button {
            background: linear-gradient(145deg, #6a11cb, #2575fc);
            color: #fff;
            padding: 12px 0;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            transition: background 0.3s ease;
        }

        button:hover {
            background: linear-gradient(145deg, #2575fc, #6a11cb);
        }

        /* Smaller textarea */
        .long-textarea {
            height: 80px;
            resize: none;
        }

        /* Floating + button at the bottom right */
        .floating-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            background-color: #ff6347; /* Contrasting color (Tomato) */
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            z-index: 3;
            transition: transform 0.2s ease;
        }

        .floating-button:hover {
            transform: scale(1.1);
            background-color: #e55039; /* Slightly darker shade on hover */
        }

    </style>
</head>
<body>

<div class="overlay"></div>

<div class="form-container">
    <h1>Add Skill Roadmap</h1>
    <form action="skupdate.jsp" method="post">
        <div class="form-group">
            <label for="skills">Skill:</label>
            <input type="text" id="skills" name="sname" placeholder="Enter relevant skills" required>
        </div>
        
        <div class="form-group">
            <label for="roadmap">Roadmap:</label>
            <textarea id="roadmap" name="roadmap" class="long-textarea" placeholder="Outline your roadmap" required></textarea>
        </div>

        <% String name = (String)session.getAttribute("name"); %>
        <% String rollno = (String)session.getAttribute("rollno"); %>
        
        <input type="hidden" name="name" value="<%=name %>">
        <input type="hidden" name="rollno" value="<%=rollno %>">
        
        <button type="submit">Submit</button>
    </form>
</div>

<!-- Floating + button -->

</body>
</html>
