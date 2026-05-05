<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugar & Silk | Register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>
    #profileImage {
        display: none;
    }
        .image {
            background-image: url('${pageContext.request.contextPath}/images/Web_Mobile_Homepage_Banner_1400x1400_b71a2730-7d5c-432a-9417-9007d1f5785c_1600x.jpg');
		    flex-shrink: 0;
        }
        #preview {
            width: 100px;
		    height: 100px;
		    border-radius: 50%; 
		    object-fit: cover; 
		    border: 3px solid #f8bbd0; 
		    background-color: #fff;
		    margin: 0 auto 10px auto;
		    display: block;
		    align-item:center;
        }
    </style>
<body>

    <div class="container">
        <div class="image"></div>

        <div class="form">
            <h1 class="brand-name">Sugar & Silk</h1>
            
            <div class="reg">
                <h2>Register</h2>
               
                <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
                    <div class="file-input-wrapper">
                    <img id="preview" src="${pageContext.request.contextPath}/images/profile_placeholder.png" alt="Profile Preview">
                    <div class="profileIcon">👤</div>
					    <input type="file" id="profileImage" name="profileImage" accept="image/*" onchange="previewFile()">
					    
					    <label for="profileImage" class="add-image-btn">Add Image</label>
					</div>
            		
                    <div class="name">
                        <label for="firstname">First Name</label>
                        <input type="text" id="name" name="firstname" placeholder="Enter your First Name" required>
                    </div>
                    
                    <div class="name">
                        <label for="lastname">Last Name</label>
                        <input type="text" id="lastname" name="lastname" placeholder="Enter your Last Name" required>
                    </div>
                    <div class="name">
                        <label for="uname">User Name</label>
                        <input type="text" id="name" name="uname" placeholder="Enter your Username" required>
                    </div>
                    <div class="gender">
					    <label for="gender">Gender</label>
					    <select id="gender" name="gender" required>
					        <option value="" disabled selected>Select your gender</option>
					        <option value="male">Male</option>
					        <option value="female">Female</option>
					        <option value="other">Other</option>
					    </select>
					</div>
                    
                    <div class="address">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" placeholder="Enter your Address" required>
                    </div>
                    
                    <div class="email">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter your Email" required>
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
                icon.style.display = "none"; // Hide default icon
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
                preview.style.display = "none";
                icon.style.display = "block";
            }
        }
    </script>
</body>
</html>