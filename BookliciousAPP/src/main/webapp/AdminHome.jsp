<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>s
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
            position: relative;
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
    /* Navbar stays black */
    #navbar:hover {
        background-color: black;
    }

    }

    ul {
        list-style: none;
        display: flex;
        gap: 20px;
        margin: 0;
        padding: 0;
    }

    ul li {
        display: inline;
    }
 /* Navbar Links */
    ul li a {
        text-decoration: none;
        color: darkred;
        font-size: 18px;
        padding: 8px 12px;
        transition: color 0.3s ease;
    }
   /* ✅ Links turn golden on hover */
    ul li a:hover {
        color: gold;
    }

    .user-info {
        color: white;
        font-size: 16px;
        margin-right: 20px;
    }

    .btn-danger {
        padding: 8px 12px;
        font-size: 16px;
        border-radius: 5px;
        background-color: red;
        color: white;
        text-decoration: none;
        transition: 0.3s;
    }

    .btn-danger:hover {
        background-color: darkred;
    }

    /* Responsive Navbar */
    @media (max-width: 768px) {
        #navbar {
            flex-direction: column;
            align-items: flex-start;
        }

        .navbar-toggler {
            display: block;
        }

        ul {
            display: none;
            flex-direction: column;
            width: 100%;
            padding-top: 10px;
        }

        ul.show {
            display: flex;
        }
    }
</style>
    </style>
</head>
<body>
    <!-- Video Background -->
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
        
        <h2>Add Book</h2>
        <form action="addBook" method="post" enctype="multipart/form-data">
            <input type="text" name="name" maxlength="30" class="form-control" placeholder="Book Name" required>
            <input type="number" name="price" max="30000" min="0" class="form-control" placeholder="Book Price" required>
            <input type="text" name="aname" maxlength="30" class="form-control" placeholder="Author" required>
            <input type="text" name="pname" maxlength="30" class="form-control" placeholder="Publisher" required>
            <label class="text-white">Upload Book Image:</label>
            <input type="file" name="photo" accept=".jpg,.png,.jpeg" class="form-control">
            <label class="text-white">Upload Book PDF:</label>
            <input type="file" name="data" accept=".pdf" class="form-control">
            <button type="submit" class="btn btn-custom">Add Book</button>
        </form>
    </div>
 <script>
    function toggleNavbar() {
        document.getElementById("navbar-links").classList.toggle("show");
    }
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
