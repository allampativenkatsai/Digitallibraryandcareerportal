<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.connect.MagzineCrud"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>approve</title>

<style>
        /* Overlay styling */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        /* Popup container styling */
        .popup {
            background-color: white;
            width: 300px;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Close "X" button styling */
        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            text-decoration: none;
            font-size: 20px;
            color: #333;
            cursor: pointer;
        }

        /* OK button styling */
        .ok-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }

        .ok-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
String title=request.getParameter("title");
String rollno=request.getParameter("rollno");

MagzineCrud book =new MagzineCrud();
int a = book.update(rollno,title);
if(a>0){%> <div class="overlay" id="popupOverlay">
<div class="popup">
<a href="appmagzine.jsp" class="close-btn">✖</a>
<h2>Success</h2>
<p>The book was added successfully.</p>
<a href="appmagzine.jsp" class="ok-btn">OK</a>
</div>
</div>
<%
}
else{
%> <div class="overlay" id="popupOverlay">
<div class="popup">
   <a href="appmagzine.jsp" class="close-btn">✖</a>
   <h2>No Success</h2>
   <p>The book was Not Added.</p>
   <a href="appmagzine.jsp" class="ok-btn">OK</a>
</div>
</div>
<%
}

%>
</body>
</html>