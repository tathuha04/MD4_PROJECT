<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Responsive Sidebar Menu | CodingLab </title>
    <link rel="stylesheet" href="style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        table {
            width: 80%;
            text-align: center;
            margin: auto;

        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page='../admin/sidebar.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>
<section class="home-section">
    <div class="text">
        <p style="text-align: center"> Singer</p>
    </div>
    <div style="margin: 20px 30px">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                data-whatever="@mdo">
            Create Singer
        </button>
    </div>
    <table class="table" style="width: 100%">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Name</th>
            <th scope="col">Avatar</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items='${requestScope["singerList"]}' var="singer">
            <tr>
                <th scope="row">${singer.getId()}</th>
                <td>${singer.getName()}</td>
                <td>${singer.getAvatar()}</td>
                <td>
                    <button type="button" class="btn btn-primary">Edit</button>
                    <a href="/singers?action=delete&id=${singer.getId()}">
                        <button type="button" class="btn btn-danger">Delete</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<%--Begin modal--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Send message</button>
            </div>
        </div>
    </div>
</div>
<%--End modal--%>

<%--<script>--%>
<%--    $('#exampleModal').on('show.bs.modal', function (event) {--%>
<%--        var button = $(event.relatedTarget) // Button that triggered the modal--%>
<%--        var recipient = button.data('whatever') // Extract info from data-* attributes--%>
<%--        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).--%>
<%--        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.--%>
<%--        var modal = $(this)--%>
<%--        modal.find('.modal-title').text('New message to ' + recipient)--%>
<%--        modal.find('.modal-body input').val(recipient)--%>
<%--    })--%>
<%--</script>--%>
</body>
</html>
