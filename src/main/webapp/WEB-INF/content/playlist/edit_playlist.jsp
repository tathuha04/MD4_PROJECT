<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2023
  Time: 11:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
    ></script>
</head>
<body>
<form method="post" action="/playlist?action=removeSong&id=${playlist.id}">
    <div>

            <div class="form-group">
                <h3>${pl.playlistName}</h3>
            </div>

        <div class="form-group">
            <label style="color: white">Chon bai hat</label>
            <select class="form-control" name="removeSong" id="" multiple>
                <c:forEach items="${songOfPlaylist}" var="spl">
                    <option value="${spl.id}">${spl.name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <button class="btn btn-primary"  type="submit">Remove Song</button>
        </div>
    </div>
</form>
<form method="post" action="/playlist?action=addSong&id=${playlist.id}" >
    <div>
<%--        <c:if test="${playlist}" var="pl">--%>
<%--            <div class="form-group">--%>
<%--                <h3>${pl.playlistName}</h3>--%>
<%--            </div>--%>
<%--        </c:if>--%>
        <div class="form-group">
            <label style="color: white">Chon bai hat</label>
            <select class="form-control" name="addSong" id="categories" multiple>
                <c:forEach items="${song}" var="s">
                    <option value="${s.id}">${s.name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <button class="btn btn-primary" id="btn-create" type="submit">Add Song</button>
        </div>
    </div>
</form>

</body>
</html>
