<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.connect.BookLogCrud,java.util.ArrayList,com.sai.model.BookLog"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>User Profile - College Library</title>
   
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e5f5fa; /* Light background */
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .container {
            max-width: 700px; /* Increased width for more content */
            margin: 50px auto;
            background: linear-gradient(to bottom right, rgba(255, 255, 255, 0.9), rgba(27, 178, 216, 0.1)); /* Lighter gradient */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s;
            text-align: center;
        }
        h1 {
            margin-bottom: 15px;
            color: #1bb2d8; /* Primary color */
        }
        .info-table {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .info-row th {
            font-weight: bold;
            color: #1bb2d8;
            padding-right: 5px;
        }
        .info-row td {
            padding-left: 5px;
            color: #333;
        }
        .book-table {
            width: 100%;
            margin: 10px auto;
            padding: 10px;
            border-radius: 5px;
        }
        .book-table th {
            background-color: #f0f0f0; /* Light gray background for headers */
            color: #1bb2d8; /* Vibrant color for header text */
            font-weight: bold;
            padding: 8px;
            text-align: center; /* Center-align header text */
        }
        .book-table td {
            padding: 8px;
            text-align: center; /* Center-align data cells */
        }
        tr:hover td {
            background-color: rgba(27, 178, 216, 0.1); /* Light hover effect */
        }
        .submit-btn {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 8px;
            background-color: #1bb2d8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background-color: #1593b1; /* Slightly darker shade on hover */
        }
    </style>
</head>
<body>


    <div class="container">
        <h1>Book Log</h1>
       
        <table class="book-table">
          <tr>
                <th style="width: 50%;">Title</th>
                <th>Taken</th>
                <th>Return</th>
            </tr>
        <%BookLogCrud b = new BookLogCrud();
				ArrayList<BookLog> list =b.read((String)session.getAttribute("rollno"));
				if(list!=null){
				for(BookLog g : list){
				%>
          
            <tr>
                <td><%=g.getTitle() %></td>
                <td><%=g.getTaken() %></td>
                <td><%=g.getReceive() %></td>
            </tr>
          <%}}else{
        out.println("no books are taken");
        }%>
        </table>
        
        
        
        <button class="submit-btn" onclick="location.href='home.jsp';">Home</button>
    </div>

</body>
</html>





