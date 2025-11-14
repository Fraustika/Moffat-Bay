<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
    content="width=device-wdith, intitalscale=1.0">
    <title>Moffat Bay Lodge | Landing Page</title>
    <link rel="stylesheet" type="text/css" href="MoffatCss.css">
     <style>
     
/* Image Containers */
     .image-container {
            width: 100%;
            position: relative;
        }
	.image-container img {
			position: absolute; 
  			top: 0;
  			left: 0;
  			width: 100%;
  			height: 60%;
 			object-fit: cover; 
  			z-index: -1; 
  			top: 295px; 
  
	    }

	.image-container1 img {
  			position: absolute; 
  			top: 0;
  			left: 0;
  			width: 100%;
  			height: 75%;
  			object-fit: cover; 
 			z-index: -1; 
 			top: 150px; 
  
	    }

        /* White Bar */
        .white-bar {
            background-color: #F4F4F4;
            height: 35px;
            width: 100%;
            margin-bottom: 0;
        }
        
        /* Container and Box */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        	z-index: 1; 
        	position: relative; 
		}

        .box {
            width: 315px;
            height: 345px;
            background-color: white;
            border: 1px solid white;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            margin: 0 20px;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 260px;
        }
        
        .box::before {
            content: '';
            position: absolute;
            top: 70%;
            left: 38%;
            width: 25%;
            height: 2px;
            background-color: #6BA4AA;
            transform: translateY(-50%);
        }
        
        /* Buttons */
        .btn {
            position: absolute;
            bottom: 10px;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            left: 0;
            right: 0;
            padding: 8px 16px;
            background-color: transparent;
            color: #F0DBC5;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            font-style: italic;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #F4F4F4;
        }

        /* Text Styles */
        h2 {
            color: #316270;
            font-family: "Raleway", sans-serif;
            font-weight: lighter;
            margin-top: 75px;
            margin-bottom: 10px;
            font-size: 24px;
        }

        h3 {
            font-weight: lighter;
            font-family: "Times New Roman", Times, serif;
            font-size: 16px;
            margin-left: 25px;
            margin-right: 25px;
            margin-top: 25px;
            text-align: center;
            font-style: italic;
        }

		hr {
            border: none;
            height: 3px;
            background-color: #ccc;
            margin: 75px auto;
            width: 50%;
        }
        
        /* Tagline */
        .tagline-div {
            color: white;
            position: absolute;
            bottom: 250px;
            width: 29%;
            margin-left: 890px;
            text-align: center;
            font-style: italic;
            font-size: 25px;
            font-family: "Times New Roman", Times, serif;
            padding: 0 5px;
        }

        .tagline-div span {
            display: block;
            padding: 0 5px;
        }

        .top-text {
            background-color: rgba(146, 183, 187, 1);
            margin-bottom: -20px;
        }

        .tagline-div .bottom-text {
            background-color: rgba(146, 183, 187, 1);
            display: inline-block;
            padding: 0 5px;
            font-size: 25px;
            top: -25px;
        }

        /* Title */
        .title {
            font-family: 'Source Sans 3', sans-serif;
            font-style: italic;
            color: white;
            text-decoration: underline;
            font-size: 35px;
            margin-bottom: 5px;
            position: absolute;
            left: 50%;
            top: 890px;
            transform: translate(-50%, -50%);
        }
        
        .soft-shadow-title {
            color: #BCC9C5;
            font-size: 4em;
            font-style: italic;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            background-color: white;
            padding: 30px;
            display: inline-block;
            margin-left: 760px;
            position: relative;
            top: 180px;
            clip-path: polygon(95% 0%, 100% 50%, 95% 100%, 0% 100%, 0 0, 0% 0%);
            box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.4);
        }

        .soft-shadow-title span {
            position: relative;
            left: 10px;
            top: 5px;
        }

        /* Footer */
        footer {
            position: relative;
        }

        .logo-text {
            position: absolute;
            left: 0;
            bottom: 1140px;
            font-size: 18px;
            font-family: 'Raleway', sans-serif;
            color: #F4F4F4;
            text-align: left;
            margin-left: 706px;
            line-height: 1.5;
            display: flex;
            align-items: center;
        }

        .logo-text::before,
        .logo-text::after {
            content: "—";
            color: #F4F4F4;
            margin: 0 0.75em;
            position: relative;
            top: 0.27em;
        }
        
 		.logo-text1 {
            position: absolute;
            left: 0;
            bottom: 1120px;
            font-size: 18px;
            font-family: 'Raleway', sans-serif;
            color: #F4F4F4;
            text-align: left;
            margin-left: 762px;
            line-height: 1.5;
            display: flex;
            align-items: center;
        }
        
    </style>
    
</head>
<body>
<header class="site-header">
    <div class="top-bar">
        <div class="logo-area">
            <img src="https://raw.githubusercontent.com/Fraustika/Moffat-Bay/main/photos/logo2.png" alt="Moffat Bay Lodge &amp; Marina logo">
            <div class="logo-text">Joviedsa</div>
            <div class="logo-text1">Island</div>
        </div>
            <nav class="main-nav">
            <a href="LoginPage.jsp">Login</a>
            <a href="CreateAccount.jsp">Create an Account</a>
            <a href="ReservationsPage.jsp">Make Your Reservation</a>
            <a href="LookupPage.jsp">Reservation Look-Up</a>
            <a href="AttractionsPage.jsp">Attractions</a>
            <a href="AboutPage.jsp">About Us</a>
            <a href="ContactPage.jsp">Contact Us</a>
        </nav>
    </div>
</header>
   <div class="white-bar"></div>

    <div class="image-container1">
        <img src="https://static.wixstatic.com/media/11062b_baad993c3eb64feba5d867ab1fd758e3~mv2.jpg/v1/fill/w_1419,h_1193,al_b,q_85,usm_0.66_1.00_0.01,enc_auto/11062b_baad993c3eb64feba5d867ab1fd758e3~mv2.jpg" alt="Moffat Bay Lodge Front">
    </div>

    <div class="title">Welcome to the Moffat Lodge!</div>

    <div>
        <h1 class="soft-shadow-title">Moffat Bay Lodge & Marina</h1>
    </div>

    <div class="tagline-div">
        <hr style="width: 7%; margin: 35px auto; border: 0; height: 2px; background-color: #6BA4AA;">
        <span class="top-text">Get ready to unwind in cozy comfort and make unforgettable memories</span><br>
        <span class="bottom-text">surrounded by nature's beauty.</span>
    </div>

    <div class="image-container">
        <img src="https://static.wixstatic.com/media/61d2a968c438494ba63caed4fb9465dd.jpg/v1/fill/w_1419,h_669,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/61d2a968c438494ba63caed4fb9465dd.jpg" alt="Moffat Bay Lodge">
        <div class="container">
            <div class="box">
                <h2>Book a Stay</h2>
                <h3>Looking to getaway? Let's begin the booking process!</h3>
                <button class="btn" onclick="window.location.href='http://localhost:8082/MoffatBay/ReservationsPage.jsp'">Let's Go</button>
            </div>

            <div class="box">
                <h2>Attractions</h2>
                <h3>Interested in staying? Come and check out what we have to offer to make this stay memorable!</h3>
                <button class="btn" onclick="window.location.href='http://localhost:8082/MoffatBay/AttractionsPage.jsp'">Show Me</button>
            </div>

            <div class="box">
                <h2>Contact Us</h2>
                <h3>Have any questions? Feel free to reach out to our expert team</h3>
                <button class="btn" onclick="window.location.href='http://localhost:8082/MoffatBay/ContactPage.jsp'">Take Me There</button>
            </div>
        </div>
    </div>

    <footer>
        <div class="footer-inner">
            <div class="footer-columns">
                <div class="footer-column">
                    <h4>Moffat Bay Lodge</h4>
                    <p>
                        1234 Bay Lodge, Joviedsa Island WA<br>
                        1-800-000
                    </p>
                </div>

                <div class="footer-column">
                    <h4>Hours</h4>
                    <p>
                        Monday - Friday<br>
                        7:00 AM - 10:00 PM<br><br>
                        Saturday - Sunday<br>
                        9:00 AM - 4:00 PM
                    </p>
                </div>

                <div class="footer-column">
                    <h4>Connect</h4>
                    <p>
                        &copy; 2035 by San Juan Islands<br>
                        Follow Us
                    </p>
                    <div class="footer-icons">
                        <span>🌊</span>
                        <span>📘</span>
                        <span>📸</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>