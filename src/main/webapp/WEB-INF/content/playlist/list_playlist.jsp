<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/20/2023
  Time: 8:27 AM
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
    <style>
        .button_create{
            background-color: #8221ac;
            color: #DDDDDD;
            border-radius: 8px;
            margin-top: 30px;
            margin-bottom: 20px;
            border:none;
        }
    </style>
</head>
<body>

<%--        <button class="button_create">BACK MENU</button>--%>

<div>
    <a href="/playlist?action=back">
        <button class="button_create">BACK MENU</button>
    </a>
    <a href="/playlist?action=create">
        <button class="button_create">CREATE NEW PLAYLIST</button>
    </a>
</div>
<table class="table align-middle mb-0 bg-white">
    <thead class="bg-light">
    <tr>
        <th>Name</th>
        <th>Title</th>
        <th>Status</th>
        <th>Make By</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${playlists}" var="pl">
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <img
                            src="${pl.avatar}"
                            alt=""
                            style="width: 45px; height: 45px"
                            class="rounded-circle"
                    />
                    <div class="ms-3">
                        <p class="fw-bold mb-1">${pl.playlistName}</p>

                    </div>
                </div>
            </td>
            <td>
                <p class="fw-normal mb-1"></p>
                <p class="text-muted mb-0"></p>
            </td>
            <td>
                <span class="badge badge-success rounded-pill d-inline">Active</span>
            </td>
            <td>Senior</td>
            <td>
                <a href="/playlist?action=detailPlaylist&id=${pl.id}">
                    <button type="button" class="btn btn-link btn-sm btn-rounded">
                        SHOW
                    </button>
                </a>
                <a href="/playlist?action=deletePlaylist&id=${pl.id}">
                    <button type="button" class="btn btn-link btn-sm btn-rounded">
                        DELETE
                    </button>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>