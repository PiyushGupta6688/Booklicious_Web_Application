<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Add Book</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Video Background */
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: #fff;
            background: rgba(0, 0, 0, 0.5);
        }

        .container {
            max-width: 500px;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            text-align: center;
            position: relative;
            z-index: 2;
        }

        h2 {
            color: #fff;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            border: none;
            margin-bottom: 15px;
            background: rgba(255, 255, 255, 0.8);
        }

        .btn-custom {
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

        .btn-custom:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .alert {
            margin-bottom: 20px;
        }

        /* Navbar Styling */
        #navbar {
            background-color: black;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .logo {
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        #navbar:hover {
            background-color: black;
        }

        ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        ul li a {
            text-decoration: none;
            color: darkred;
            font-size: 18px;
            padding: 8px 12px;
            transition: color 0.3s ease;
        }

        ul li a:hover {
            color: gold;
        }
    </style>
</head>
<body>
    <video autoplay muted loop class="video-background">
        <source src="/Home/Adminhome.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
 <!-- Modal -->
 <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-black text-gold">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Change Password</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
                 <form action="updatePassword" method="post">
                  <div class="mb-3">
                      <input type="password" name="opass" maxlength="30" class="form-control" placeholder="Enter old password" required>
                  </div>
                  <div class="mb-3">
                         <input type="password" name="npass" maxlength="30" class="form-control" placeholder="Enter new password" required>
                  </div>
                  <div class="mb-3">
                         <input type="password" name="rpass" maxlength="30" class="form-control" placeholder="Re-Enter new password" required>
                  </div>
                  <button type="submit" class="btn btn-danger">Update</button>
              </form>
        </div>
      </div>
    </div>
  </div>
</header>

  
    <nav id="navbar">
        <div class="logo">Booklicious</div>
    
        <ul id="navbar-links">
            <li><a href="AdminHome.jsp">Home</a></li>
            <li><a href="allBook">All Books</a></li>
        </ul>
    
        <!-- Profile Dropdown Menu -->
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                Profile
            </button>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                <li><span class="dropdown-item">Welcome: <b>${sessionScope.name}</b></span></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#passwordModal">Change Password</a></li>
                <li><a class="dropdown-item text-danger" href="logout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <c:if test="${msg != null}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Message:</strong> ${msg}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <c:remove var="msg" scope="session"/>
        </c:if>
    </div>

    <c:forEach items="${books}" var="b">
        <div class="container text-start">
            <div class="row mb-3">
                <div class="col-4">
                    <img alt="book image" src="/getBookImage?name=${b.name}" height="100px">
                </div>
                <div class="col-8">
                    <p>Name: <b>${b.name}</b></p>
                    <p>Price: <b>${b.price}</b></p>
                    <p>Author Name: <b>${b.aname}</b></p>
                    <p>Publisher Name: <b>${b.pname}</b></p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <form action="editBook" method="post">
                        <input type="hidden" name="name" value="${b.name}">
                        <button class="btn btn-danger" type="submit">Edit Book</button>
                    </form>
                </div>
                <div class="col">
                    <form action="viewBook" method="post">
                        <input type="hidden" name="name" value="${b.name}">
                        <button class="btn btn-success" type="submit">View Book</button>
                    </form>
                </div>
                <div class="col">
                    <form action="downloadBook" method="post">
                        <input type="hidden" name="name" value="${b.name}">
                        <button class="btn btn-primary" type="submit">Download Book</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>

    <script>
        function toggleNavbar() {
            document.getElementById("navbar-links").classList.toggle("show");
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
