<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/18/2023
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
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
    </STYLE>

</head>
<body>
<jsp:include page='../admin/sidebar.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<section class="home-section">
    <div class="category">
        <p>Category Manager</p>
        <div class="w3-container">
            <a href="/category?action=create">
                <button onclick="document.getElementById('id01').style.display='block'">+ Create Category</button>
            </a>
            <div id="id01" class="w3-modal">
                <div class="w3-modal-content">
                    <div class="w3-container">
                    <span onclick="document.getElementById('id01').style.display='none'"
                          class="w3-button w3-display-topright">&times;</span>
                        <jsp:include page="../content/category/create.jsp">
                            <jsp:param name="articleId" value=""/>
                        </jsp:include>
                    </div>
                </div>
            </div>
        </div>

    </div>

<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col"></th>
        <th scope="col">Name</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <c:forEach items='${requestScope["listCategory"]}' var="ctm">
        <tbody>
        <tr>
            <th scope="row">${ctm.getId()}</th>
            <td><img width="100px" height="100px" style="border-radius: 5px" src="${ctm.getAvatar()}"></td>
            <td>${ctm.getName()}</td>
            <td>
                <button type="button" class="btn btn-primary">Edit</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </td>
        </tr>
        </tbody>
    </c:forEach>

</table>
</section>
</body>
<script>
    function validate() {
        let name = document.getElementById('name').value;
        if(name.trim()==''){
            document.getElementById('validate').innerHTML = 'The name is required!'
            document.getElementById('validate').className = 'alert alert-danger';
        } else {
            document.getElementById('validate').innerHTML = ''
            document.getElementById('validate').className = '';
        }
    }
</script>
</html>