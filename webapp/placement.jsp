<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.sai.model.Placement,com.sai.connect.PlacementCrud"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Experience Sharing</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('images/place.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
            overflow: hidden; /* Prevent scrolling */
        }

        h1 {
            margin: 20px 0;
            color: #4fcdff;
            font-size: 2em;
            
        }

        .chat-container {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            width: 100%;
            max-width: 700px; /* Maximum width of chat */
            height: calc(100vh - 100px); /* Adjust height to accommodate header */
            overflow-y: auto; /* Enable vertical scrolling */
            padding: 20px; /* More padding for aesthetics */
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.8), rgba(238, 244, 248, 0.9)), url('pattern.png'); /* Gradient with texture */
            background-size: cover; /* Cover the entire container */
            border-radius: 25px; /* More rounded corners */
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.15); /* Enhanced shadow for depth */
        }

        .message {
            max-width: 70%; /* Limit the width of the message */
            padding: 15px;
            border-radius: 15px;
            margin: 10px 0;
            position: relative;
            word-wrap: break-word; /* Ensure long words break correctly */
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s; /* Smooth transition for hover effects */
        }

        .message:hover {
            transform: translateY(-3px); /* Lift effect on hover */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Shadow on hover for depth */
        }

        .student-message {
            background-color: rgba(231, 243, 255, 0.9); /* Slightly transparent light blue for student messages */
            color: #333; /* Dark text for readability */
            align-self: flex-start; /* Align to the left */
            border-left: 5px solid #4fcdff; 
             text-align: justify; /* Add border for a unique touch */
        }

        .admin-message {
            background-color: rgba(212, 237, 218, 0.9); /* Slightly transparent light green for admin messages */
            color: #333; /* Dark text for readability */
            align-self: flex-end; /* Align to the right */
            border-left: 5px solid #28a745; /* Add border for admin messages */
        }

        .author {
            font-size: 12px;
            color: #555; /* Dark gray for author text */
            text-align: right;
            margin-top: 5px;
            font-style: italic; /* Italic for author's name for distinction */
        }

        /* Add Experience Button */
        .add-experience-btn {
            position: fixed;
            bottom: 30px; /* Distance from bottom */
            right: 30px; /* Distance from right */
            background-color: #4fcdff; /* Button color */
            color: white; /* Text color */
            border: none; /* Remove border */
            border-radius: 50%; /* Round button */
            width: 60px; /* Width of button */
            height: 60px; /* Height of button */
            font-size: 24px; /* Icon size */
            cursor: pointer; /* Pointer cursor on hover */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            transition: background-color 0.3s; /* Transition for hover effect */
        }

        .add-experience-btn:hover {
            background-color: #3ab0e3; /* Darker shade on hover */
        }

        /* Modal */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1000; /* On top of other content */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5); /* Black with transparency */
            justify-content: center; /* Center modal */
            align-items: center; /* Center modal */
        }

        .modal-content {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            width: 300px; /* Modal width */
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.2); /* Shadow for depth */
        }

        .close {
            color: #aaa; /* Close button color */
            float: right; /* Float right */
            font-size: 28px; /* Close button size */
            font-weight: bold; /* Bold font */
            cursor: pointer; /* Pointer cursor */
        }

        .close:hover,
        .close:focus {
            color: black; /* Change color on hover/focus */
            text-decoration: none; /* No underline */
            cursor: pointer; /* Pointer cursor */
        }

        input, textarea {
            width: 100%; /* Full width inputs */
            margin-top: 10px; /* Space above inputs */
            padding: 10px; /* Padding for inputs */
            border: 1px solid #ccc; /* Border */
            border-radius: 5px; /* Rounded corners */
            box-sizing: border-box; /* Include padding in width */
        }

        button.submit {
            background-color: #4fcdff; /* Submit button color */
            color: white; /* Submit text color */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            padding: 10px; /* Padding */
            cursor: pointer; /* Pointer cursor */
            width: 100%; /* Full width */
            margin-top: 10px; /* Space above */
        }

        button.submit:hover {
            background-color: #3ab0e3; /* Darker shade on hover */
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .chat-container {
                width: 95%; /* Full width on small screens */
            }
            .message {
                font-size: 14px; /* Smaller font size */
            }
            h1 {
                font-size: 2em; /* Smaller header on mobile */
            }
            .modal-content {
                width: 90%; /* Full width on mobile */
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Student Experience</h1>
</header>
<%
PlacementCrud p = new PlacementCrud();
ArrayList<Placement> list =p.read();
if(list!=null && !list.isEmpty()){

	%>
<div class="chat-container">
<%for(Placement k : list){ %>
    <!-- Student Message 1 -->
    <div class="message student-message">
        <p><strong><%=k.getName()%>:</strong> <%=k.getText() %>.</p>
        <div class="author">Posted by <%=k.getRollno()%></div>
    </div>

  <%} }%>
   
</div>

<button class="add-experience-btn" id="addExperienceBtn">
   <a href="pd.jsp"> <i class="fas fa-plus"></i></a>
</button>

</body>
</html>





