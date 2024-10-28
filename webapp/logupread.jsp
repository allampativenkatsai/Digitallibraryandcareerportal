<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.connect.BookLogCrud,java.util.ArrayList,com.sai.model.BookLog,
    com.sai.connect.Crud,com.sai.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Update</title>
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
    // Retrieve parameters from the request
    String name = request.getParameter("name");
    String rollno = request.getParameter("rollno");
    String branch = request.getParameter("branch");
    String title = request.getParameter("title");
    String taken = request.getParameter("taken");
    String receive = request.getParameter("receive");

    // Create a new BookLog object with the provided parameters
    BookLog b = new BookLog(name, rollno, branch, title, taken, receive);
    out.println(receive);
    // Create an instance of BookLogCrud and attempt to update the book log
    BookLogCrud book = new BookLogCrud();
    int boo = book.update(b); // Assuming this method updates the book and returns a status
    out.println(b.getReceive());
    // Check the result of the update
    if (boo <= 0) {
%>
        <div class="overlay" id="popupOverlay">
            <div class="popup">
                <a href="logcrud.jsp?rollno=<%=rollno %>" class="close-btn">✖</a>
                <h2>Not Success</h2>
                <p>The book was not updated.</p>
                <a href="logcrud.jsp?rollno=<%=rollno %>" class="ok-btn">OK</a>
            </div>
        </div>
<%
    } else {
%>
        <div class="overlay" id="popupOverlay">
            <div class="popup">
                <a href="logcrud.jsp?rollno=<%=rollno %>" class="close-btn">✖</a>
                <h2>Success</h2>
                <p>The book was updated.</p>
                <a href="logcrud.jsp?rollno=<%=rollno %>" class="ok-btn">OK</a>
            </div>
        </div>
<%
    }
%>
</body>
</html>
