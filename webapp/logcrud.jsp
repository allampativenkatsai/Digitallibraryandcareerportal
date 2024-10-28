<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sai.connect.BookLogCrud,java.util.ArrayList,com.sai.model.BookLog,
    com.sai.connect.Crud,com.sai.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Book Log</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/backhome6.jpg') no-repeat center center fixed;
            background-size: cover;
            overflow: hidden; /* Prevent scrolling */
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.7);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            margin-top: 5px;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            height: 500px; /* Auto height to fit table content */
        }

        h1 {
            text-align: center;
            color:#e0e4e4 ;
            font-size: 2.5em;
        }

        .add-button {
            margin-bottom: 15px;
        }

        .add-button button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .add-button button:hover {
            background-color: #218838;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 300px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333;
        }

        td {
            background-color: rgba(255, 255, 255, 0.2);
            vertical-align: middle; /* Ensure icons are vertically aligned */
        }

        td i {
            margin: 5px 0;
            cursor: pointer;
            font-size: 18px;
            color: #FFD700;
            display: block; /* Make icons appear vertically */
        }

        td i:hover {
            color: #FFA500;
        }

        .action-icons {
            text-align: center;
            width: 50px; /* Narrow the width for just icons */
        }

        /* Remove the extra space between icons */
        .action-icons i {
            margin: 0;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h1>Book Log Details</h1>
     

<%
String rollno = request.getParameter("rollno");
Crud crud = new Crud();
User u = crud.read(rollno);
if(u!=null){%>


         <div class="add-button">
         <a href="logadd.jsp?name=<%=u.getName() %>&rollno=<%=u.getRollno() %>
         &branch=<%=u.getBranch() %>"><button type="button">Add Book</button></a>
         
        </div>
        <%}else{
        	out.println("no user");
        	}%>
        
        
        
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Roll Number</th>
                    <th>Branch</th>
                    <th>Book Title</th>
                    <th>Date Taken</th>
                    <th>Date to Return</th>
                    <th></th> <!-- No header for action icons -->
                </tr>
            </thead>
            
<%   
BookLogCrud book = new BookLogCrud();
ArrayList<BookLog> list = book.read(rollno);
 if (list != null  && !list.isEmpty()) {
for(BookLog l:list){%>
            <tbody>
                <tr>
                    <td><%=l.getName() %></td>
                    <td><%=l.getRollno() %></td>
                    <td><%=l.getBranch() %></td>
                    <td><%= l.getTitle() %></td>
                    <td><%= l.getTaken()%></td>
                    <td> <%= l.getReceive() %></td>
                    <td class="action-icons">
                    
<a href="logupdate.jsp?name=<%=l.getName() %>&rollno=<%=l.getRollno() %>
&branch= <%=l.getBranch() %>&<%= l.getTitle() %>
&<%= l.getTaken()%>&<%= l.getReceive() %>"> <i class="fas fa-edit" title="Edit"></i></a>
           <a href="logdelete.jsp?name=<%=l.getName() %>&rollno=<%=l.getRollno() %>
&branch= <%=l.getBranch() %>&<%= l.getTitle() %>
&<%= l.getTaken()%>&<%= l.getReceive() %>">             
                        <i class="fas fa-trash-alt" title="Delete"></i></a>
                    </td>
                </tr>
             
<%} }else{
	
	out.println("no books are taken");
}
%>  
               
            </tbody>
        </table>
    </div>
</body>
</html>








