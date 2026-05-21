<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
     
    <title>Contact Us</title>
</head>
<body>
		<%@ include file="header.jsp" %>
        <main>
		    <!-- Hero Banner -->
        <section class="contact-hero">
            <div class="hero-overlay">
                <h1>Do you have any <br>Questions?</h1>
                <p>We are happy to answer any question you may have!</p>
            </div>
        </section>

        <!-- Flash messages -->
        <c:if test="${sessionScope.contactSuccess == true}">
            <div class="alert alert-success">
                &#10003; Your message has been sent! We'll get back to you soon.
            </div>
            <c:remove var="contactSuccess" scope="session"/>
        </c:if>

        <c:if test="${sessionScope.contactError == true}">
            <div class="alert alert-error">
                &#10007; Something went wrong. Please try again.
            </div>
            <c:remove var="contactError" scope="session"/>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                &#10007; ${errorMessage}
            </div>
        </c:if>

        <!-- Contact Form -->
        <section class="contact-section">
            <div class="contact-card">
                <h2>Contact Us</h2>

                <%-- POST to /contactus --%>
                <form action="${pageContext.request.contextPath}/contactus" method="post">

                    <div class="form-row">
                        <input type="text"  name="firstName" placeholder="First Name *" required>
                        <input type="text"  name="lastName"  placeholder="Last Name *"  required>
                    </div>

                    <div class="form-row">
                        <input type="email" name="email" placeholder="Email *" required>
                        <input type="tel"   name="phone" placeholder="Phone Number">
                    </div>

                    <div class="form-group">
                        <input type="text" name="subject" placeholder="Subject of your Message">
                    </div>

                    <div class="form-group">
                        <textarea name="message" placeholder="Your Message *" rows="6" required></textarea>
                    </div>

                    <div class="form-submit">
                        <button type="submit" class="btn-submit">Submit Your Message</button>
                    </div>
                </form>
            </div>
        </section>

		</main>
		
		<%@ include file="footer.jsp" %>
</body>
</html>