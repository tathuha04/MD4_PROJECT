<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/16/2023
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        html {
            box-sizing: border-box;
            font-family: sans-serif;
        }

        *, *:before, *:after {
            box-sizing: inherit;
        }

        .column {
            float: left;
            width: 33.3%;
            margin-bottom: 16px;
            padding: 0 8px;
        }

        @media screen and (max-width: 650px) {
            .column {
                width: 100%;
                display: block;
            }
        }

        .btn {
            margin: 24px;
        }

        .btn button {
            height: 30px;
            width: 150px;
            background-color: rebeccapurple;
            color: #D5D5D5;
            border-radius: 2px;
            border: none;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            margin: 15px;
            border-radius: 10px;

        }

        .card img {
            border-radius: 5px;
        }

        .card p {
            text-align: center;
            font-size: 16px;
            font-weight: 500;
        }

        .container {
            padding: 0 16px;
        }

        .container::after, .row::after {
            content: "";
            clear: both;
            display: table;
        }
    </style>

</head>
<body>
<div class="btn">
    <button>+ Create Playlist</button>
</div>
<div class="row">
    <c:forEach items="${listCategory}" var="ctm">
        <div class="column">
            <div class="card">
                <img src="${ctm.getAvartar()}"
                     style="width:100%">
                <div class="container">
                    <p>${ctm.getName()}</p>
                </div>
            </div>
        </div>
    </c:forEach>
<%--    <div class="column">--%>
<%--        <div class="card">--%>
<%--            <img src="https://www.saigonroses.com/blog/wp-content/uploads/2020/01/y-nghia-cua-hoa-tulip-theo-mau-sac-3-e1577954221878.jpg"--%>
<%--                 style="width:100%">--%>
<%--            <div class="container">--%>
<%--                <p>Jane Doe</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:if test="${pageNumber != 1}">
                <li class="page-item"><a class="page-link" href="/category?action=page_grid&page=${pageNumber-1}">Previous</a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${sumOfPage}" var="i" varStatus="red">
                <c:choose>
                    <c:when test="${pageNumber eq i}">
                        <li class="page-item"><a style="color: red" class="page-link" href="/category?action=page_grid&page=${i}">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a  class="page-link" href="/category?action=page_grid&page=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            <c:if test="${pageNumber lt sumOfPage}">
                <li class="page-item"><a href="/category?action=page_grid&page=${pageNumber + 1}">Next</a></li>
            </c:if>
        </ul>
    </nav>
</div>

</body>

</html>
