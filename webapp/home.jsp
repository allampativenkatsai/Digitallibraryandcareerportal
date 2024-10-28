<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JNTUA College Library</title>
    <style>
        /* Resetting default margins and paddings */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        /* Body styling */
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-image: url('images/f2.avif'), url('another-background.jpg'); /* Add your second background image here */
            background-size: cover, cover; /* Cover both images */
            background-position: center, center; /* Center both images */
            background-attachment: fixed, fixed; /* Keep background fixed */
        }

        /* Header styling */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color:  #46a7c7; /* Semi-transparent background */
            color: white;
            padding: 10px;
            font-weight: bold;
        }

        header .logo {
            display: flex;
            align-items: center;
        }

        header .logo img {
            height: 50px;
            margin-right: 10px;
        }

        header nav {
            margin-left: auto; /* Push navigation to the right */
        }

        header nav ul {
            list-style-type: none;
            display: flex;
            align-items: center;
            margin-right: 10px;
        }

        header nav ul li {
            margin: 0 10px;
            position: relative;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        header nav ul li a:hover {
            text-decoration: underline;
        }

        /* Dropdown Menu for Books, Projects, Academics */
        .dropdown {
            display: none;
            position: absolute;
            top: 100%; /* Position below the parent menu item */
            left: 0;
            background-color:rgba(0, 0, 0, 0.5); /* Light black overlay */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .dropdown a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: white;
        }

        .dropdown a:hover {
            background-color: #108db7;
        }

        /* Show dropdown on hover */
        header nav ul li:hover .dropdown {
            display: block;
        }

        /* User icon and dropdown styles */
        .user-icon {
            position: relative;
            cursor: pointer;
        }

        .user-icon img {
            height: 40px;
            border-radius: 50%;
            margin-right: 40px;
        }

        .dropdown {
            display: none;
            position: absolute;
            right: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Light black overlay */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            width: 100px;
        }

        .dropdown a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #82d7f4;
        }

        .dropdown a:hover {
            background-color: #eee;
        }

        .user-icon:hover .dropdown {
            display: block;
        }

        /* Hero Section */
        .hero {
            height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
         
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .hero .quote {
            font-size: 20px;
            font-style: italic;
            margin-bottom: 30px;
            max-width: 600px;
        }

        /* Cards Section */
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 40px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.347);
            border-radius: 15px;
            text-align: center;
            width: 250px;
            padding: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card img {
            height: 50px;
            width: 60px;
            margin-bottom: 15px;
        }

        .card h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color:#108db7;
        }

        .card p {
            font-size: 16px;
            margin-bottom: 20px;
            color: white;
        }

        .card button {
            background-color:  #108db7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .card button:hover {
            background-color: #82d7f4;
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 8px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1;
        }
        .dropdown-menu a {
            display: block;
            padding: 10px;
            color: white;
            text-decoration: none;
        }
        .dropdown-menu a:hover {
            background-color: #108db7;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 32px;
            }

            .hero p {
                font-size: 16px;
            }

            header {
                padding: 15px;
            }

            .cards-container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Header with logo and navigation -->
    <header>
        <div class="logo">
            <img src="images/ok.png" alt="JNTUA Logo"> <!-- Replace with your logo image -->
            <p>JNTUA COLLEGE OF Engineering<p>
        </div>
        <nav>
            <ul>
             <li><a href="about.html">About</a></li>
                <li><a href="#">Books</a>
                    <div class="dropdown">
                        <a href="book.jsp?branch=civil">Civil</a>
                        <a href="book.jsp?branch=mech">Mechanical</a>
                        <a href="book.jsp?branch=eee">EEE</a>
                        <a href="book.jsp?branch=ece">ECE</a>
                        <a href="book.jsp?branch=cse">CSE</a>
                    </div>
                </li>
                <li><a href="#">Projects</a>
                    <div class="dropdown">
                       <a href="project.jsp?branch=trending projects">TRENDINGPROJECT</a>	
	<a href="project.jsp?branch=civil" >CIVIL</a>
	<a href="project.jsp?branch=eee" >EEE</a>
	<a href="project.jsp?branch=mech" >MECHANICAL </a>
	<a href="project.jsp?branch=ece" >ECE </a>
	<a href="project.jsp?branch=cse" >CSE</a>
                    </div>
                </li>
                <li><a href="#">Academics</a>
                    <div class="dropdown">
                        <a href="exampdf.jsp?branch=civil" >CIVIL</a>

	<a href="exampdf.jsp?branch=eee" >EEE</a>
	
	<a href="exampdf.jsp?branch=mech" >MECH</a>
	
	<a href="exampdf.jsp?branch=ece" >ECE</a>
	
	<a href="exampdf.jsp?branch=cse" >CSE</a>
	
	
                    </div>
                </li>
                <li><a href="magzine.jsp">Magzines</a></li>
                <li><a href="news.jsp">News</a></li>
                <li><a href="inread.jsp">Internships</a></li>
                <li><a href="placeme.html">Placements</a></li>
            </ul>
        </nav>
        <div class="user-icon">
            <img src="images/loginicon.png" alt="User Icon"> <!-- Replace with your user icon -->
            <div class="dropdown">
                <a href="booklog.jsp">Book Log</a>
                <a href="details.jsp">Details</a>
                <a href="initial.html">Sign Out</a>
            </div>
        </div>
    </header>

    <!-- Hero section with background image and quote -->
    <div class="hero">
        <h1>Welcome to JNTUA College Library</h1>
        <p id="username"><%=session.getAttribute("name") %></p> 
        <p>Explore thousands of books, projects, and resources at your fingertips.</p>
        <p class="quote">"The only thing that you absolutely have to know is the location of the library." – Albert Einstein</p>
        
    </div>
    
    <!-- Cards section showcasing resources -->
    <section class="cards-container">
       <div class="card">
            <img src="images/conlogo.jpg" alt="Books">
            <h3>Books</h3>
            <p>Browse through various categories of academic books and reference materials.</p>
            <button onclick="toggleDropdown('booksDropdown')">Explore</button>
            <div id="booksDropdown" class="dropdown-menu">
                <a href="book.jsp?branch=civil">Civil</a>
                <a href="book.jsp?branch=mech">Mechanical</a>
                <a href="book.jsp?branch=ece">ECE</a>
                <a href="book.jsp?branch=cse">CSE</a>
                <a href="book.jsp?branch=eee">EEE</a>
            </div>
        </div>
        <div class="card">
            <img src="images/conlogo.jpg" alt="Projects">
            <h3>Projects</h3>
            <p>Explore academic projects across various engineering fields.</p>
            <button onclick="toggleDropdown('projectsDropdown')">Explore</button>
            <div id="projectsDropdown" class="dropdown-menu">
                <a href="project.jsp?branch=civil">Civil</a>
                <a href="project.jsp?branch=mech">Mechanical</a>
                <a href="project.jsp?branch=ece">ECE</a>
                <a href="project.jsp?branch=cse">CSE</a>
                <a href="project.jsp?branch=eee">EEE</a>
            </div>
        </div>
        <div class="card">
            <img src="images/conlogo.jpg" alt="Academics">
            <h3>Academics</h3>
            <p>Find resources and materials for academic excellence.</p>
            <button onclick="toggleDropdown('academicsDropdown')">Explore</button>
            <div id="academicsDropdown" class="dropdown-menu">
                <a href="exampdf.jsp?branch=civil" >CIVIL</a>
                        <a href="exampdf .jsp?branch=eee" >EEE</a>
                        <a href="exampdf.jsp?branch=mech" >MECH</ a>
                        <a href="exampdf.jsp?branch=ece" >ECE</a>
                        <a href="exampdf.jsp?branch=cse" >CSE</a>
            </div>
        </div>

        <div class="card">
            <img src="images/conlogo.jpg" alt="Magazines">
            <h3>Magazines</h3>
            <p>Stay updated with the latest academic and research magazines.</p>
            <a href="magzine.jsp"> <button>Explore</button></a>
        </div>

        <div class="card">
            <img src="images/conlogo.jpg" alt="Internships">
           <h3>Internships</h3>
            <p>Explore internship opportunities for real-world experience.</p>
             <a href="inread.jsp"><button>Explore</button></a>
        </div>

        <div class="card">
            <img src="images/conlogo.jpg" alt="Placements">
          <h3>Placements</h3>
            <p>Discover placement opportunities and career guidance resources.</p>
             <a href="placeme.html"> <button>Explore</button></a>
        </div>
    </section>
    <script>
    // Function to toggle the dropdown visibility
    function toggleDropdown(dropdownId) {
        var dropdown = document.getElementById(dropdownId);
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    // Close dropdown when clicking outside
    document.addEventListener("click", function(event) {
        var dropdowns = document.querySelectorAll(".dropdown-menu");
        dropdowns.forEach(function(dropdown) {
            if (!event.target.closest(".card")) {
                dropdown.style.display = "none";
            }
        });
    });
</script>
</body>
</html>
