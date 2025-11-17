<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <!-- Page title and shared stylesheet -->
    <title>Account Verification</title>
    <link rel="stylesheet" href="CreateMoffatCss.css">
</head>
<body>

<!-- Main wrapper for account verification messages -->
<div class="account-main">
    <section class="account-card">
<%
    // ================================
    // Read form parameters from request
    // ================================
    String firstName    = request.getParameter("firstName");
    String lastName     = request.getParameter("lastName");
    String email        = request.getParameter("email");
    String confirmEmail = request.getParameter("confirmEmail");
    String password     = request.getParameter("password");
    String phoneRaw     = request.getParameter("phone");

    // ================================
    // Normalize and sanitize basic input
    // ================================
    firstName    = (firstName    == null) ? "" : firstName.trim();
    lastName     = (lastName     == null) ? "" : lastName.trim();
    email        = (email        == null) ? "" : email.trim().toLowerCase();
    confirmEmail = (confirmEmail == null) ? "" : confirmEmail.trim().toLowerCase();
    password     = (password     == null) ? "" : password.trim();
    phoneRaw     = (phoneRaw     == null) ? "" : phoneRaw.trim();

    // ================================
    // Required field validation
    // ================================
    if (firstName.isEmpty() || lastName.isEmpty()
            || email.isEmpty() || confirmEmail.isEmpty()
            || password.isEmpty() || phoneRaw.isEmpty()) {
%>
        <h2 class="account-title">Missing Information</h2>
        <p>All fields are required. One or more fields were left blank.</p>
        <ul>
            <li>First Name: <%= firstName.isEmpty() ? "missing" : "provided" %></li>
            <li>Last Name: <%= lastName.isEmpty() ? "missing" : "provided" %></li>
            <li>Email: <%= email.isEmpty() ? "missing" : "provided" %></li>
            <li>Confirm Email: <%= confirmEmail.isEmpty() ? "missing" : "provided" %></li>
            <li>Password: <%= password.isEmpty() ? "missing" : "provided" %></li>
            <li>Phone Number: <%= phoneRaw.isEmpty() ? "missing" : "provided" %></li>
        </ul>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // ========================================
    // Basic server-side email match validation
    // ========================================
    if (!email.equals(confirmEmail)) {
%>
        <h2 class="account-title">Account Creation Error</h2>
        <p>Email and Confirm Email do not match.</p>
        <p>
            Email entered: <strong><%= email %></strong><br>
            Confirm Email entered: <strong><%= confirmEmail %></strong>
        </p>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // ========================================
    // Email format validation
    // ========================================
    String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    if (!email.matches(emailRegex)) {
%>
        <h2 class="account-title">Invalid Email Address</h2>
        <p>The email address you entered is not in a valid format.</p>
        <p>Email entered: <strong><%= email %></strong></p>
        <p>Example of a valid format: name@example.com</p>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // ============================================
    // Validate first and last name content/length
    // ============================================
    String namePattern = "^[A-Za-z\\-'\\s]{1,50}$";
    boolean firstNameValid = firstName.matches(namePattern);
    boolean lastNameValid  = lastName.matches(namePattern);

    if (!firstNameValid || !lastNameValid) {
%>
        <h2 class="account-title">Invalid Name</h2>
        <p>Names may only contain letters, spaces, hyphens, and apostrophes, up to 50 characters.</p>
        <ul>
            <li>First Name "<%= firstName %>": <%= firstNameValid ? "valid" : "invalid" %></li>
            <li>Last Name "<%= lastName %>": <%= lastNameValid ? "valid" : "invalid" %></li>
        </ul>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // ============================================
    // Validate password strength (simple rule)
    // ============================================
    boolean longEnough = password.length() >= 8;
    boolean hasLetter  = password.matches(".*[A-Za-z].*");
    boolean hasDigit   = password.matches(".*[0-9].*");

    if (!longEnough || !hasLetter || !hasDigit) {
%>
        <h2 class="account-title">Weak Password</h2>
        <p>Your password does not meet the minimum security requirements.</p>
        <ul>
            <li>At least 8 characters: <%= longEnough ? "yes" : "no" %></li>
            <li>Contains at least one letter: <%= hasLetter ? "yes" : "no" %></li>
            <li>Contains at least one number: <%= hasDigit ? "yes" : "no" %></li>
        </ul>
        <p>Please choose a stronger password.</p>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // ============================================
    // Normalize phone to digits only and validate
    // ============================================
    String phoneDigits = phoneRaw.replaceAll("[^0-9]", "");

    // Only accept phone numbers with 10 or 11 digits
    if (phoneDigits.length() < 10 || phoneDigits.length() > 11) {
%>
        <h2 class="account-title">Invalid Phone Number</h2>
        <p>The phone number must contain 10 or 11 digits after removing spaces and symbols.</p>
        <p>Digits found: <strong><%= phoneDigits.length() %></strong></p>
        <p>Original input: <strong><%= phoneRaw %></strong></p>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // Optional: reject obviously fake inputs like all identical digits
    if (phoneDigits.matches("(\\d)\\1{9,10}")) {
%>
        <h2 class="account-title">Invalid Phone Number</h2>
        <p>The phone number appears to be invalid because all digits are the same.</p>
        <p>Digits entered: <strong><%= phoneDigits %></strong></p>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
        return;
    }

    // ================================
    // Database connection information
    // ================================
    String url  = "jdbc:mysql://localhost:3306/moffatbaytables";
    String user = "student1";
    String pass = "pass";

    Connection conn             = null;
    PreparedStatement checkStmt = null;
    PreparedStatement insertStmt= null;
    ResultSet rs                = null;

    try {
        // ============================================
        // Load MySQL driver and establish connection
        // ============================================
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        // ===============================================
        // Convert phone digits string to long for BIGINT
        // ===============================================
        long phoneNumber = Long.parseLong(phoneDigits);

        // =======================================================
        // Check for existing account with same email or phone
        // =======================================================
        String checkSql =
            "SELECT customer_id FROM Customer WHERE email = ? OR phone_number = ?";
        checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setString(1, email);
        checkStmt.setLong(2, phoneNumber);
        rs = checkStmt.executeQuery();

        if (rs.next()) {
            // Existing record found
%>
            <h2 class="account-title">Account Already Exists</h2>
            <p>An account with this email or phone number already exists.</p>
            <ul>
                <li>Email checked: <strong><%= email %></strong></li>
                <li>Phone checked: <strong><%= phoneDigits %></strong></li>
            </ul>
            <p>
                Please try a different email or phone, or
                <a href="LoginPage.jsp">log in here</a>.
            </p>
<%
        } else {
            // ===============================================
            // Insert new customer record when no duplicate
            // ===============================================
            String insertSql =
                "INSERT INTO Customer (first_name, last_name, email, phone_number, password) " +
                "VALUES (?, ?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, firstName);
            insertStmt.setString(2, lastName);
            insertStmt.setString(3, email);
            insertStmt.setLong(4, phoneNumber);
            insertStmt.setString(5, password); // note: plain text, consider hashing later

            int rows = insertStmt.executeUpdate();

            if (rows > 0) {
%>
                <h2 class="account-title">Account Created</h2>
                <p>Your account has been successfully created.</p>
                <ul>
                    <li>Name: <strong><%= firstName %> <%= lastName %></strong></li>
                    <li>Email: <strong><%= email %></strong></li>
                    <li>Phone: <strong><%= phoneDigits %></strong></li>
                </ul>
                <p><a href="LoginPage.jsp">Click here to log in.</a></p>
<%
            } else {
%>
                <h2 class="account-title">Account Creation Error</h2>
                <p>The database did not report any rows inserted.</p>
                <p>This means the account was not created, even though no exception occurred.</p>
                <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
            }
        }

    // ==========================
    // Specific exception handling
    // ==========================
    } catch (NumberFormatException nfe) {
%>
        <h2 class="account-title">Invalid Phone Number</h2>
        <p>There was an issue converting the phone number to a numeric format.</p>
        <p>Digits received: <strong><%= phoneDigits %></strong></p>
        <p>Technical detail: <%= nfe.getMessage() %></p>
        <p><a href="CreateAccount.jsp">Return to Create Account</a></p>
<%
    } catch (ClassNotFoundException cnfe) {
%>
        <h2 class="account-title">Database Driver Error</h2>
        <p>The MySQL JDBC driver could not be found on the server classpath.</p>
        <p>Technical detail: <%= cnfe.getMessage() %></p>
<%
    } catch (SQLException sqle) {
%>
        <h2 class="account-title">Database Error</h2>
        <p>There was a problem communicating with the database.</p>
        <p><strong>SQL State:</strong> <%= sqle.getSQLState() %></p>
        <p><strong>Error Code:</strong> <%= sqle.getErrorCode() %></p>
        <p><strong>Message:</strong> <%= sqle.getMessage() %></p>
<%
    } finally {
        // ==========================
        // Clean up JDBC resources
        // ==========================
        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
        try { if (checkStmt != null) checkStmt.close(); } catch (Exception ignore) {}
        try { if (insertStmt != null) insertStmt.close(); } catch (Exception ignore) {}
        try { if (conn != null) conn.close(); } catch (Exception ignore) {}
    }
%>
    </section>
</div>

</body>
</html>

