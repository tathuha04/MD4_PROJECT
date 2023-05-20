<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/19/2023
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no"/>
    <style>
        .container {
            margin: 40px 40px;
        }

        .form-group {
            margin-top: 30px;
        }

    </style>
</head>

<body style="background-color: #231B2E">
<H1 style="text-align: center; color: white; margin-top: 30px">Create a new playlist</H1>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<div class="container">
    <form method="post" action="">
        <div>
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="Enter the name of Playlist">
            </div>
            <div class="form-group">
                    <div>
                        <script>
                            const firebaseConfig = {
                                apiKey: "AIzaSyB2A6FtigGGXUQXV0D_FPouPKY8JKplhnk",
                                authDomain: "projectmd4-deb2e.firebaseapp.com",
                                projectId: "projectmd4-deb2e",
                                storageBucket: "projectmd4-deb2e.appspot.com",
                                messagingSenderId: "1053012108561",
                                appId: "1:1053012108561:web:d7c4f96532e4c6d891d8b0",
                                measurementId: "G-F6LQ7VE1T5"
                            };
                        </script>
                        <label style="color: white">Avatar</label>
                        <jsp:include page="../../upload/upload_avatar.jsp">
                            <jsp:param name="articleId" value=""/>
                        </jsp:include>
                    </div>
                </select>
            </div>
            <div>
                <button class="btn btn-primary" id="btn-create" type="submit">Create Playlist</button>
            </div>
        </div>
    </form>
</div>
</body>