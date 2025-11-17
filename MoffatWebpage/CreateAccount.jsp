<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge | Create an Account</title>
    <link rel="stylesheet" type="text/css" href="CreateMoffatCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

</head>
<body>

    <!-- Full-width header -->
    <header class="site-header">
        <div class="top-bar">
            <div class="logo-area">
                <img src="https://raw.githubusercontent.com/Fraustika/Moffat-Bay/main/photos/logo2.png" alt="Moffat Bay Lodge &amp; Marina logo">
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

    <!-- Full-width accent strips -->
    <div class="white-strip"></div>
    <div class="peach-strip"></div>

    <!-- Full-width hero image -->
    <div class="hero-image about-hero"></div>

    <!-- Centered page content -->
    <div class="page-wrapper">

    <!-- Main body for Create Account page -->
    <main class="account-main">
        <section class="account-card">

            <!-- Page title -->
            <h1 class="account-title">Create an Account</h1>

            <!-- Account creation form -->
            <form action="AccountVerify.jsp" method="post" id="createAccountForm"
                  onsubmit="return validateAccountForm();">

                <div class="account-form-grid">

                    <!-- First Name -->
                    <div>
                        <label for="firstName" class="account-label">First Name *</label>
                        <input type="text" id="firstName" name="firstName"
                               class="account-input" required>
                    </div>

                    <!-- Last Name -->
                    <div>
                        <label for="lastName" class="account-label">Last Name *</label>
                        <input type="text" id="lastName" name="lastName"
                               class="account-input" required>
                    </div>

                    <!-- Email -->
                    <div class="account-form-row-full">
                        <label for="email" class="account-label">Email *</label>
                        <input type="email" id="email" name="email"
                               class="account-input" required>
                    </div>

                    <!-- Confirm Email -->
                    <div class="account-form-row-full">
                        <label for="confirmEmail" class="account-label">Confirm Email *</label>
                        <input type="email" id="confirmEmail" name="confirmEmail"
                               class="account-input" required>
                        <div id="emailError" class="account-help-text" style="display:none;">
                            Email and Confirm Email must match.
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="account-form-row-full">
                        <label for="password" class="account-label">Password *</label>
                        <input type="password" id="password" name="password"
                               class="account-input" required>
                    </div>

                    <!-- Phone -->
                    <div class="account-form-row-full">
                        <label for="phone" class="account-label">Phone *</label>
                        <input type="text" id="phone" name="phone"
                               class="account-input" required>
                    </div>

                </div>

                    <!-- Submit button -->
                <div class="account-submit-wrapper">
                    <button type="submit" class="account-submit">Register</button>
                </div>

                <!-- Terms and Privacy note -->
                <div class="account-terms">
                    By creating an account you are agreeing to our
                    <a href="ComingSoon.jsp">Terms of Use</a> and our
                    <a href="ComingSoon.jsp">Privacy Policy</a>
                </div>

            </form>

        </section>
    </main>

    </div>

    <!-- Simple client-side check that emails match -->
    <script>
        function validateAccountForm() {
            const email = document.getElementById("email").value.trim();
            const confirmEmail = document.getElementById("confirmEmail").value.trim();
            const errorDiv = document.getElementById("emailError");

            if (email !== confirmEmail) {
                errorDiv.style.display = "block";
                return false;
            } else {
                errorDiv.style.display = "none";
            }
            return true;
        }
    </script>





        <!-- Standard Footer -->
<footer>
    <div class="footer-wave"></div>

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