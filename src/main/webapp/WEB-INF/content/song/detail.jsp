<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/18/2023
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table">
    <tr>
        <th>STT</th>
        <th>NAME</th>
        <th>SRC</th>
        <th></th>
    </tr>
   <c:if test="${song!=null}">
       <td>${song.id}</td>
       <td>${song.name}</td>
       <td>
           <audio controls src="${song.src}"></audio></td>

   </c:if>
</table>
</body>
</html>
