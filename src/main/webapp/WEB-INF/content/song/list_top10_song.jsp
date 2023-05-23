<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/22/2023
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<head>
    <title>Title</title>
</head>
<body>
<div class="main">
  <h2 style="text-align: center"> TOP 10 VIEW OF SONG</h2>
  <table class="table table-dark">
    <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">AVATAR</th>
      <th scope="col">NAME</th>
      <th scope="col">ARTIST</th>
      <th scope="col">VIEW</th>
      <th scope="col">ACTION</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${song}" var="s">
      <tr>
        <td>${s.id}</td>
        <td><img style="width: 50px; height: 50px" src="${s.avatar}" alt=""></td>
        <td>${s.name}</td>
        <td>${s.artist}</td>
        <td>${s.numberOfView}</td>
        <td><a href="/song?action=detail&id=${s.id}">PLAY</a></td>
      </tr>
    </c:forEach>


    </tbody>
  </table>
</div>
</body>
</html>
