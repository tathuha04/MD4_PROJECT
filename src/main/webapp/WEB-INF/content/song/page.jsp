
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
      width: 33.3%;
      padding: 10px 10px;
    }
    .card {
      box-shadow: 10px 10px 2px 1px rgba(230, 0, 255, 0.97);
      background-color: aqua;
    }
    div.card {
      padding: 10px;
    }
    img {
      width: auto;
      height: 200px;
      border-radius: 15%;
    }
  </style>
</head>
<body>
<div class="container">
  <a href="/song?action=creat"><button>CREAT SONG</button></a>
  <div class="col-12" style="margin-top: 20px">
    <div class="row">
      <table class="table">
        <tr>
          <th>STT</th>
          <th>NAME</th>
          <th></th>
        </tr>
        <c:forEach items="${listSong}" var="ls">
          <tr>
            <td >${ls.id}</td>
            <td>${ls.name}</td>
            <td><a href="/song?action=detail&id=${ls.id}">SHOW</a></td>
          </tr>
        </c:forEach>
      </table>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <c:if test="${pageNumber != 1}">
          <li class="page-item"><a class="page-link" href="/song?action=page_grid&page=${pageNumber-1}">Previous</a>
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
          <li class="page-item"><a href="/song?action=page_gid&page=${pageNumber + 1}">Next</a></li>
        </c:if>
      </ul>
    </nav>
  </div>
</div>

</body>
</html>