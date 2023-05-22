
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  <style>
    .colum {
      width: 33%;
      padding: 20px 20px;
    }
    .card {
      box-shadow: 4px 4px 2px 0px #c4c2c2;
      background-color: #f1efef;
    }
    .card img {
      border-radius: 2px;
      height: 260px;
    }
    div.card {
      padding: 10px;
    }
    img {
      width: auto;
      height: 200px;
      border-radius: 15%;
    }
    .btn_create{
      margin-left: 125px;
      margin-top: 30px;
      width: 110px;
      height: 35px;
      border-radius: 8px;
      border: none;
      background-color: #8221ac;
      color: #DDDDDD;
    }
    .buttonNP{
      width: auto;
      height: 37.33px;
      background-color: white;
      border: 1px #d7d6d6;
    }
    .namesong{
      color: black;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<a href="/song?action=create">
  <button class="btn_create">
    Create song
  </button>
</a>
<div class="container">
  <div class="col-12" style="margin-top: 20px">
    <div class="row">
      <c:forEach items="${listSong}" var="song">
        <div class="colum">
          <a href="/song?action=detail&id=${song.getId()}">
            <div class="card">
              <img  src="${song.getAvatar()}" alt="">
              <p class="namesong">${song.getName()}</p>
            </div>
          </a>
        </div>
      </c:forEach>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <c:if test="${pageNumber != 1}">
          <li class="page-item"><a class="page-link" href="/song?action=page_grid&page=${pageNumber-1}"><button class="buttonNP">Previous</button></a>
          </li>
        </c:if>
        <c:forEach begin="1" end="${sumOfPage}" var="i" varStatus="red">
          <c:choose>
            <c:when test="${pageNumber eq i}">
              <li class="page-item"><a style="color: red" class="page-link" href="/song?action=page_grid&page=${i}">${i}</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a  class="page-link" href="/song?action=page_grid&page=${i}">${i}</a></li>
            </c:otherwise>
          </c:choose>

        </c:forEach>
        <c:if test="${pageNumber lt sumOfPage}">
          <li class="page-item"><a href="/song?action=page_grid&page=${pageNumber + 1}"><button class="buttonNP">Next</button></a></li>
        </c:if>
      </ul>
    </nav>
  </div>
</div>
</body>
</html>