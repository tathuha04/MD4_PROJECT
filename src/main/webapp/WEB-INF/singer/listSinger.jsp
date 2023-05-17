<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/05/2023
  Time: 5:12 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1 style="color: red">===========Singer============</h1>
<table class="table table-dark table-striped" style="text-align: center; width: 70%">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Avatar</th>
    </tr>
    <c:forEach items='${requestScope["singerList"]}' var="ctm">
    <tr>
        <td>${ctm.getId()}</td>
        <td>${ctm.getName()}</td>
        <td>${ctm.getAvatar()}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
