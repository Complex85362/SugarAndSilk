<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Register</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css?v=1.1">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>
    .image {
        background-image: url('${pageContext.request.contextPath}/images/5568e5fa-44a4-4324-8e09-646a5b71e593_processed.jpg');
        flex-shrink: 0;
    }
    #preview {
        width: 100px;
        height: 100px;
        border-radius: 50%; 
        object-fit: cover; 
        border: 3px solid #E5C3A9; 
        background-color: #fff;
        margin: 0 auto 10px auto;
        display: block;
        align-item:center;
    }
    
    
    .error-banner {
        color: #d32f2f;
        background-color: #ffebee;
        border: 1px solid #ffcdd2;
        padding: 10px;
        border-radius: 8px;
        text-align: center;
        margin-bottom: 15px;
        font-family: 'Poppins', sans-serif;
        font-size: 14px;
        font-weight: 600;
    }
</style>
<body>

    <div class="container">
        <div class="image"></div>

        <div class="form">
            <h1 class="brand-name">Sugar & Silk</h1>
            
            <div class="reg">
                <h2>Register</h2>
               
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error-banner">
                        ${errorMessage}
                    </div>
                <% } %>
               
                <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
                    <div class="file-input-wrapper">
                        <img id="preview" src="${pageContext.request.contextPath}/images/profile_placeholder.png" alt="Profile Preview">
					    <input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="previewFile()">
					    <label for="profileImage" class="add-image-btn">Add Image</label>
					</div>
            		
                    <div class="name">
                        <label for="firstname">First Name</label>
                        <input type="text" id="name" name="firstname" value="${savedFirstname}" placeholder="Enter your First Name" required>
                    </div>
                    
                    <div class="name">
                        <label for="lastname">Last Name</label>
                        <input type="text" id="lastname" name="lastname" value="${savedLastname}" placeholder="Enter your Last Name" required>
                    </div>
                    <div class="name">
                        <label for="uname">User Name</label>
                        <input type="text" id="uname" name="uname" value="${savedUname}" placeholder="Enter your Username" required>
                    </div>
                    <div class="gender">
					    <label for="gender">Gender</label>
					    <select id="gender" name="gender" required>
					        <option value="" disabled ${empty savedGender ? 'selected' : ''}>Select your gender</option>
					        <option value="male" ${savedGender == 'male' ? 'selected' : ''}>Male</option>
					        <option value="female" ${savedGender == 'female' ? 'selected' : ''}>Female</option>
					        <option value="other" ${savedGender == 'other' ? 'selected' : ''}>Other</option>
					    </select>
					</div>
                    
                    <div class="address">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" value="${savedAddress}" placeholder="Enter your Address" required>
                    </div>
                    
                    <div class="email">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="${savedEmail}" placeholder="Enter your Email" required>
                    </div>
                    
                    <div class="pass">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your Password" required>
                    </div>
                    
                    <button type="submit" class="login-btn">Register</button>
                    
                    <div class="form-link">
                        <span>Already have an account? </span>
                        <a href="${pageContext.request.contextPath}/login">Login</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<script>
        function previewFile() {
            const preview = document.getElementById('preview');
            const file = document.querySelector('input[type=file]').files[0];
            const reader = new FileReader();
            const icon = document.getElementById('defaultIcon');

            reader.onloadend = function () {
                preview.src = reader.result;
                preview.style.display = "block";
                if(icon) icon.style.display = "none"; // Safe check execution
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "${pageContext.request.contextPath}/images/profile_placeholder.png";
                preview.style.display = "block";
                if(icon) icon.style.display = "block";
            }
        }
    </script>
</body>
</html>