<%@taglib prefix="c" uri="jakarta.tags.core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${appName} - Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .hero {
            text-align: center;
            padding: 50px 20px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }
        .container {
            max-width: 1100px;
            margin-top: 30px;
        }
        .book-card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            transition: transform 0.3s;
            text-align: center;
        }
        .book-card:hover {
            transform: scale(1.05);
        }
        .book-card img {
            display: block;
            margin: 0 auto 10px;
            border-radius: 5px;
            width: 150px;
            height: 200px;
            object-fit: cover;
        }
        .btn-add {
            margin-top: 10px;
            background-color: #667eea;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-add:hover {
            background-color: #564bb2;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #343a40;
            color: white;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
      <nav id="navbar">
        <div class="logo">Booklicious</div>
        <div class="nav-links">
             <a href="index.jsp">Home</a>
            <a href="#">Shop</a> 
             
            <a href="#">Donate</a>
        </div>
        <div class="search-bar">
            <form action="/getBooks" method="post">
                <input type="text" name="name" placeholder="Search for books...">
                <button type="submit"><i class="ri-search-line"></i></button>
            </form>
        </div>
        <div class="nav-icons">
         <a href="#">Cart</a>
            <a href="/login">Login</a>
          
            <i class="ri-shopping-cart-2-line"></i>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to Booklicious</h1>
        <p>Explore our amazing collection of books</p>
    </div>

    <!-- Books Section -->
    <div class="container" id="books">
        <h2 class="text-center mb-4">Our Collection</h2>
        <div class="row">
            <c:forEach items="${books}" var="b">
                <div class="col-md-4">
                    <div class="book-card">
                        <img alt="Book Image" src="/getBookImage?name=${b.name}" width="150px" height="200px">
                        <h5>${b.name}</h5>
                        <p><strong>Price:</strong> ${b.price}</p>
                        <p><strong>Author:</strong> ${b.aname}</p>
                        <p><strong>Publisher:</strong> ${b.pname}</p>
                        <button class="btn-add">Add to Cart</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Booklicious. All rights reserved.</p>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js"></script>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>