<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booklicious</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css">
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
   <div id="page1">
    
    <h1>Where Stories </h1> 
    <h1>Live, </h1>
    <h1> and Readers Thrive!</h1>
    <div id="video-container">
        <div id="play">Play</div>
        <video autoplay loop muted>
            <source src="/videos/Page1f.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>
    </div>
    
    <div id="page2">
        <div id="elem1" class="elem">
            <img data-scroll data-scroll-speed="1"
                src="https://imgix.bustle.com/scary-mommy/2021/06/21/titanic-quotes.jpg?w=1200&h=1200&fit=crop&crop=faces&fm=jpg"
                alt="">
            <div data-scroll data-scroll-speed="-2" class="dets"></div>

        </div>
        <div id="elem2" class="elem">
            <img data-scroll data-scroll-speed="1"
                src="https://i.pinimg.com/736x/db/1c/1f/db1c1fab30a2a73d8ae676ba33b7d735.jpg"
                alt="">
            <div data-scroll data-scroll-speed="-2" class="dets"></div>

        </div>
        <div id="elem3" class="elem">
            <img data-scroll data-scroll-speed="1"
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFzZzOdE8WG9XvhTopi4F6NRtzABLWQcwsgg&s"
                alt="">
            <div data-scroll data-scroll-speed="-2" class="dets"></div>
        </div>

        </div>

 <h2 id="recommended-books">Recommended Books</h2> 
  
 <div id="page3">
    <div class="child">
        <img src="https://m.media-amazon.com/images/I/81q77Q39nEL._AC_UF1000,1000_QL80_.jpg" 
             alt="Book Pack 1" loading="lazy">
             <br><h3> Harry Potter and the Philosopher's Stone</h3>
             <br><br><br>
        <form action="productDetails.jsp" method="POST">
            <input type="hidden" name="productName" value="Book Pack 1">
            <input type="hidden" name="productImage" value="">
            <button type="submit" class="view-btn">View Details</button>
        </form>
    </div>

    <div class="child">
        <img src="https://rukminim2.flixcart.com/image/850/1000/xif0q/regionalbooks/v/k/m/murder-on-the-orient-express-original-imagkfjpwtrfzamh.jpeg?q=20&crop=false" 
             alt="Book Pack 2" loading="lazy">
              <br>
              <h3>Murder on the Orient Express</h3>
              <br><br><br>
        <form action="productDetails.jsp" method="POST">
            <input type="hidden" name="productName" value="Book Pack 2">
            <input type="hidden" name="productImage" value="">
            <button type="submit" class="view-btn">View Details</button>
        </form>
    </div>

    <div class="child">
        <img src="https://d3ddkgxe55ca6c.cloudfront.net/assets/t1614594070/a/db/b0/121018-ml-91963.jpg" 
             alt="Book Pack 3" loading="lazy">
              <br><h3> Don't Be Horrid, Henry!</h3>
             <br><br><br>
        <form action="productDetails.jsp" method="POST">
            <input type="hidden" name="productName" value="Book Pack 3">
            <input type="hidden" name="productImage" value="">
            <button type="submit" class="view-btn">View Details</button>
        </form>
    </div>

    <div class="child">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdaHC_2iwzahYguWAhgXRdbpnixsCI5vM5mA&s" 
             alt="Book Pack 4" loading="lazy">
              <br><h3> Peaceful Warrior</h3>><br><br><br>
        <form action="productDetails.jsp" method="POST">
            <input type="hidden" name="productName" value="Book Pack 4">
            <input type="hidden" name="productImage" value="">
            <button type="submit" class="view-btn">View Details</button>
        </form>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js"></script>
</body>
</html>
