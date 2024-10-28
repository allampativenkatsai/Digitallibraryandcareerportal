<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sai.connect.BookCrud, java.util.ArrayList, com.sai.model.Book"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Book Approval</title>
    <style>
        /* Full-page background styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: rgba(120, 209, 247, 0.25);
        }

        /* Centered table overlay with container styling */
        .container-wrapper {
            position: relative;
            z-index: 2;
        }

        /* Overlay positioned behind the table container */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Dark overlay */
            border-radius: 8px;
            z-index: 1;
        }

        /* Container for table content */
        .container {
            position: relative;
            width: 1000px; /* Set a valid max-width */
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 2;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f5f5f5;
            color: #333;
        }

        .action-btns button {
            padding: 8px 12px;
            margin-right: 5px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .approve-btn {
            background-color: #4CAF50;
            color: white;
        }

        .reject-btn {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
<form action="appudatebook.jsp">
    <div class="container-wrapper">
        <div class="overlay"></div>
        <div class="container">
            <h1>Pending Book Approvals</h1>
             <%
                BookCrud b = new BookCrud();
                ArrayList<Book> list = b.read();

                if (list != null && !list.isEmpty()) {
                    for (Book p : list) {
                        if (p != null && "no".equals(p.getApprove())) {
                %>
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Branch</th>
                        <th>Uploaded By</th>
                        <th>Roll No</th>
                        <th>Availability</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
               
                    <tr>
                        <td><a href="<%= p.getUrl() %>"><%= p.getTitle() %></a></td>
                        <td><%= p.getAuthor() %></td>
                        <td>p.getBranch()</td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getRollno() %></td>
                        <td><input name="available" type="text"></td>
                         <input type="hidden" name="title" value="<%= p.getTitle() %>">
    <input type="hidden" name="rollno" value="<%= p.getRollno() %>">
                        <td class="action-btns">
                         <input type="submit"  class="approve-btn" value="Approve">
                            
                            <button class="reject-btn"> <a href="appdeletebook.jsp?title=<%= p.getTitle() %>&rollno=<%= p.getRollno() %>">Reject</a></button>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    </form>
    <%
                } else {
    %>
    <p>No books available .</p>
    <%
                }
    %>
</body>
</html>
