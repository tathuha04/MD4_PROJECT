<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/17/2023
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="format-detection" content="telephone=no" />
  <style>
    .container{
      margin: 40px 40px;
    }
    .form-group{
      margin-top: 30px;
    }

  </style>
</head>

<body style="background-color: #231B2E">
<H1 style="text-align: center; color: white; margin-top: 30px">Create a new list</H1>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<div class="container">
  <form method="post">
    <div>
      <div class="form-group">
        <input type="text" name="name" class="form-control" placeholder="Enter the name of Song">
      </div>
      <div class="form-group">
        <label style="color: white" >Chon the loai</label>
        <select class="form-control" name="categories" id="categories">
          <c:forEach items="${categories}" var="c">
            <option value="${c.id}">${c.name}</option>
          </c:forEach>
        </select>
        <label style="color:white">Chon ban nhac </label>
        <select class="form-control" name="listBand" id="listBand" multiple>
          <c:forEach items="${listBand}" var="b">
            <option value="${b.id}">${b.name}</option>
          </c:forEach>
        </select>
        <label style="color: white" >Chon ca sy </label>
        <select class="form-control" name="listSinger" id="listSinger" multiple>
        <c:forEach items="${listSinger}" var="s">
          <option value="${s.id}">${s.name}</option>
        </c:forEach>
      </select>
      </div>
      <div>
        <button class="btn btn-primary" id="btn-create" type="submit">Create Song</button>
      </div>
    </div>
  </form>
</div>
</body>
