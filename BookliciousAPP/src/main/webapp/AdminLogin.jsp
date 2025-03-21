<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
             display: flex;
             flex-direction: column;
             min-height: 100vh;
             background: #e7dac7;
            }


        .main-container {
            display: flex;
            flex-grow: 1;
            width: 100%;
            background-color: rgb(224, 211, 175);
        }

        .left-section {
            width: 50%;
            height: calc(100vh - 70px);
        }
       
       .right-section {
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
   
  
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
    background: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
    backdrop-filter: blur(10px); /* Soft blur effect */
   
    padding: 50px;
}

        .login-container {
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-control {
    border-radius: 8px;
    padding: 12px;
    font-size: 16px;
    width: 100%;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    box-shadow: inset 0px 2px 4px rgba(0, 0, 0, 0.1); /* Soft inner shadow */
}


.btn-login {
    width: 100%;
    background-color: #28a745;
    color: white;
    padding: 12px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-login:hover {
    background-color: #218838;
    transform: scale(1.05); /* Slight scaling effect */
}


        .forgot-password, .signup-link {
            display: block;
            margin-top: 10px;
            font-size: 14px;
            text-decoration: none;
        }

        .forgot-password {
            color: #007bff;
        }

        .signup-link {
            color: #28a745;
        }

        .forgot-password:hover, .signup-link:hover {
            text-decoration: underline;
        }

        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 14px;
        }
        .left-section img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px; /* Soft edges */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}
.right-section, .left-section {
    opacity: 0;
    transform: translateY(20px);
    animation: fadeIn 0.8s ease forwards;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

    </style>
</head>
<body>


  <nav id="navbar">
        <div class="logo">Booklicious</div>
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="#">Shop</a>
             
            <a href="#">Donate</a>
        </div>
        <div class="search-bar">
            <form action="<%= request.getContextPath() %>/search" method="get">
                <input type="text" name="query" placeholder="Search for books...">
                <button type="submit"><i class="ri-search-line"></i></button>
            </form>
        </div>
        <div class="nav-icons">
         <a href="#">Cart</a>
            <a href="<%= request.getContextPath() %>/login">Login</a>
            <i class="ri-shopping-cart-2-line"></i>
        </div>
    </nav>
   <!-- Include Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<div class="main-container">
    <!-- Left Section with Image -->
    <div class="left-section">
        <img src="/loginpage.jpg" alt="Login Image" style="width: 100%; height: 100%; object-fit: cover;">
    </div>

    <!-- Right Section with Login Form -->
    <div class="right-section">
        <div class="login-container">
            <c:if test="${msg!=null}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong>Message: </strong> ${msg}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="msg" scope="session"/>
            </c:if>

            <h2>ADMIN LOGIN</h2>
            <form action="adminLogin" method="post">
                <input type="text" class="form-control" placeholder="User Id" name="id" required>
                <input type="password" class="form-control" placeholder="Password" name="password" required>
                <button type="submit" class="btn-login">SIGN IN</button>
            </form>
            
            <!-- Forgot Password - Triggers Modal -->
            <a href="#" class="forgot-password" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Forgot User name / password?</a>

            <a href="#" class="signup-link">SIGN UP</a>
        </div>
    </div>
</div>

<!-- Forgot Password Modal (Black Theme) -->
<div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color: black; color: white;">
            <div class="modal-header" style="border-bottom: 1px solid #555;">
                <h5 class="modal-title" id="forgotPasswordModalLabel">Reset Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="filter: invert(1);"></button>
            </div>
            <div class="modal-body">
                <form action="forgetPassword" method="post">
                    <label for="email" style="font-weight: bold;">Enter your email ID</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required 
                           style="margin-top: 5px; background-color: #222; color: white; border: 1px solid #555;">
                    <br>
                    <button type="submit" style="width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px;">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

 <footer id="footer">
    <div class="footer-content">
        <div class="footer-logo">Booklicious</div>
        <p>Your go-to place for stories that inspire and captivate. Let's make the world a better place through books!</p>
        <div class="footer-links">
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
        </div>
        <div class="footer-socials">
            <a href="#"><i class="ri-facebook-circle-fill"></i></a>
            <a href="#"><i class="ri-twitter-fill"></i></a>
            <a href="#"><i class="ri-instagram-fill"></i></a>
            <a href="#"><i class="ri-linkedin-fill"></i></a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 Booklicious. All Rights Reserved.</p>
    </div>
</footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="script.js"></script>
</body>
</html>