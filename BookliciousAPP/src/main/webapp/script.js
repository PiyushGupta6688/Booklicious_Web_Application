function  videoanimation(){
    var videocon = document.querySelector("#video-container");
    var playbtn = document.querySelector("#play");

    // Add mouseenter event
    videocon.addEventListener("mouseenter", function () {
        gsap.to(playbtn, {
            scale: 1,
            opacity: 1,
            duration: 0.5 // Optional: Animation duration
        });
    });

    // Add mouseleave event
    videocon.addEventListener("mouseleave", function () {
        gsap.to(playbtn, {
            scale: 0,
            opacity: 0,
            duration: 0.5 // Optional: Animation duration
        });
    });

    // Add mousemove event to move the play button with the mouse
    videocon.addEventListener("mousemove", function (e) {
        // Get the mouse position relative to the video container
        var offsetX = e.offsetX;
        var offsetY = e.offsetY;

        // Move the play button to the mouse position
        gsap.to(playbtn, {
            left: offsetX - playbtn.offsetWidth / 2 + "px", // Center the button on the mouse position
            top: offsetY - playbtn.offsetHeight / 2 + "px",  // Center the button on the mouse position
            duration: 0.2 // Optional: Animation duration for smoothness
        });
    });
videocon.addEventListener("mousemove", function (dets) {
    gsap.to(playbtn, {
        left: dets.x,
        top: dets.y,
        duration: 0.5 // Optional: Add animation duration
    });
});

}
videoanimation()
function lodinganimantion(){
    gsap.from("#page1 h1",{
        y:100,
        opacity:0,
        delay:0.4,
        duration:0.9,
        stagger:0.4

    })
    gsap.from("#page1 #video-container",{
        scale:0.8,
        opacity:0,
        delay:1,
        duration:0.8,
        

    })
}

lodinganimantion()

document.addEventListener("DOMContentLoaded", () => {
    const navbar = document.getElementById("navbar");
    const searchInput = document.getElementById("searchInput");

    // Smooth scrolling for links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener("click", function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute("href")).scrollIntoView({
                behavior: "smooth"
            });
        });
    });

    // Change navbar style on scroll
    window.addEventListener("scroll", () => {
        if (window.scrollY > 50) {
            navbar.classList.add("scrolled");
        } else {
            navbar.classList.remove("scrolled");
        }
    });

    // Expand search bar on focus
    searchInput.addEventListener("focus", () => {
        gsap.to(".search-bar", { width: "300px", duration: 0.5 });
    });

    searchInput.addEventListener("blur", () => {
        gsap.to(".search-bar", { width: "200px", duration: 0.5 });
    });
});
document.addEventListener("DOMContentLoaded", function () {
    gsap.registerPlugin(ScrollTrigger);

    // Scroll effect for page2
    gsap.from("#page2 .elem", {
        opacity: 0,
        y: 100,
        duration: 1.2,
        stagger: 0.3,
        ease: "power3.out",
        scrollTrigger: {
            trigger: "#page2",
            start: "top 80%", // Start animation when 80% of page2 is visible
            toggleActions: "play none none none",
        }
    });

    // Faster hover animation with pointer cursor
    document.querySelectorAll(".elem").forEach((elem) => {
        elem.style.cursor = "pointer"; // Set pointer cursor on hover

        elem.addEventListener("mouseenter", () => {
            gsap.to(elem.querySelector("img"), {
                scale: 1.2,
                duration: 0.2, // Faster effect
                ease: "power2.inOut",
            });
        });

        elem.addEventListener("mouseleave", () => {
            gsap.to(elem.querySelector("img"), {
                scale: 1.1,
                duration: 0.2, // Quick reset
                ease: "power2.inOut",
            });
        });
    });
});
document.addEventListener("DOMContentLoaded", function () {
    const images = document.querySelectorAll(".child img");

    images.forEach((img) => {
        // Fade-in effect on page load
        setTimeout(() => {
            img.style.opacity = "1";
        }, 500);

        // Click to open in new tab
        img.addEventListener("click", () => {
            window.open(img.src, "_blank");
        });
    });
});



