<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/18/2023
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>LIST SONG</title>
</head>
<body>

<div class="container">
    <h2 style="text-align: center">LIST SONG</h2>
    <a href="/singers?action=back">BACK MENU</a>
    <a href="/song?action=create"><button>CREAT SONG</button></a>
    <div class="row">
        <div class="col-12" style="margin-top: 20px; margin-bottom: 20px">
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

            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${pageNumber != 1}">
                        <li class="page-item"><a class="page-link" href="/song?action=page_grid&page=${pageNumber-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${sumOfPage}" var="i">
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
                        <li class="page-item"><a href="/song?action=page_grid&page=${pageNumber + 1}">Next</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
