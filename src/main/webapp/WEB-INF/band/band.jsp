<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/05/2023
  Time: 9:13 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="color: red" style="text-align: center" width="70%">====================BAND======================</h1>
<table border="1" style="text-align: center" width="70%">
    <tr>
        <th>STT</th>
        <th>Band Name</th>
        <th>Avatar</th>
    </tr>
    <c:forEach items='${requestScope["bandList"]}' var='band'>
        <tr>
            <td>${band.getId()}</td>
            <td>${band.getName()}</td>
            <td>${band.getAvatar()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
