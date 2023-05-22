<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <STYLE>
        .table {
            margin: auto;
            width: 80%;
            height: 100%;
            text-align: center;
        }

        .category {
            margin-left: 10%;
            margin-bottom: 30px;
        }

        .category p {
            font-family: sans-serif;
            font-size: 25px;
            font-weight: 600;
            text-align: center;
            margin-right: 100px;
            margin-top: 50px;
        }

        .category .w3-container button {
            border-radius: 5px;
            padding: 8px;
            background-color: #721799;
            color: #E4E9F7;
            border: none;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }


        .buttonDelete {
            background-color: crimson;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            width: 20%;
            opacity: 0.9;
            border-radius: 8px;
        }

        .buttonEdit {
            background-color: orange;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            width: 20%;
            opacity: 0.9;
            border-radius: 8px;
        }

        button:hover {
            opacity: 1;
        }


    </STYLE>

</head>
<body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<!-- Button trigger modal -->

<section class="home-section">
    <div class="category">
        <p>Band Manager</p>
        <div class="w3-container">
            <a href="/band?action=create">
                <button onclick="document.getElementById('id01').style.display='block'">+ Create Band</button>
            </a>
            <div id="" class="w3-modal">
                <div class="w3-modal-content">
                    <div class="w3-container">
                    </div>
                </div>
            </div>
        </div>

    </div>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Avatar</th>
            <th scope="col">Name</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <script>
            // thêm vào để upload ko bị lỗi
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
        <c:forEach items='${requestScope["bandList"]}' var="ctm">
        <tbody>
        <tr>

            <th scope="row">${ctm.getId()}</th>
            <td><img width="100px" height="100px" style="border-radius: 5px" src="${ctm.getAvatar()}"></td>
            <td>${ctm.getName()}</td>
            <td>
                <a data-toggle="modal"
                   data-target="#edit${ctm.id}">
                    <button type="button" class="buttonEdit">Edit</button>
                </a>
                <a data-toggle="modal"
                   data-target="#delete${ctm.id}">
                    <button type="button" class="buttonDelete"> Delete</button>
                </a>
            </td>
            <!-- Modal Delete-->
            <div class="modal fade" id="delete${ctm.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">FORM DELETE BAND</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Do you want to delete the singer with id : ${ctm.id}?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal">No</button>
                            <a href="/band?action=delete&id=${ctm.id}">
                                <button type="submit" class="btn btn-danger">Yes</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

                <%--                modal edit--%>

            <div class="modal fade" id="edit${ctm.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">FORM UPDATE BAND</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Please fill in the following information according to the template to update the
                                information for the singer with id : ${ctm.id}.</p>
                            <form method="post" style="height: 50px">
                                <label>Name</label>
                                <input name="name" value=${ctm.getName()}>
                                <br>
                                <label>Avatar</label>
                                <jsp:include page="../upload/upload_avatar.jsp">
                                    <jsp:param name="articleId" value="${ctm.getId()}"/>
                                </jsp:include>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancel</button>
                            <a href="/singers?action=update&id=${ctm.id}">
                                <button type="submit" class="btn btn-danger">Save</button>
                            </a>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </tr>
        </tbody>
        </c:forEach>
        <script>
            function validate() {
                let name = document.getElementById('name').value;
                if (name.trim() == '') {
                    document.getElementById('validate').innerHTML = 'The name is required!'
                    document.getElementById('validate').className = 'alert alert-danger';
                } else {
                    document.getElementById('validate').innerHTML = ''
                    document.getElementById('validate').className = '';
                }
            }
        </script>
</html>

