<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/13/2023
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%--<jsp:include page='../../bootstrap/sidebar_navbar.jsp'>--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>
<head>
  <title>Title</title>
  <style>
    table {
      margin: 0 auto;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-12" style="text-align: center">
      <form method="post" >
        <c:if test="${requestScope['success']==null}">
          <label class="alert alert-danger" style="color: red" id="validate">Please fill name to input and upload avatar</label>
        </c:if>
        <c:if test="${requestScope['success']!=null}">
          <label class="alert alert-primary" style="color: green" >Create band success!</label>
        </c:if>
        <c:if test='${requestScope["validate"]!=null}'>
          <label style="color: red">${requestScope["validate"]}</label>
        </c:if>
        <table>
          <tr>
            <td>Name</td>
            <td><input oninput="validate()" id="name" type="text" name="name"></td>
          </tr>
          <tr>
            <td>Avatar</td>
            <td>
              <script>
                const firebaseConfig = {
                  apiKey: "AIzaSyB2A6FtigGGXUQXV0D_FPouPKY8JKplhnk",
                  authDomain: "projectmd4-deb2e.firebaseapp.com",
                  projectId: "projectmd4-deb2e",
                  storageBucket: "projectmd4-deb2e.appspot.com",
                  messagingSenderId: "1053012108561",
                  appId: "1:1053012108561:web:d7c4f96532e4c6d891d8b0",
                  measurementId: "G-F6LQ7VE1T5"
                };
              </script>
              <jsp:include page="../upload/upload_avatar.jsp">
                <jsp:param name="articleId" value=""/>
              </jsp:include>
            </td>
          </tr>
          <tr style="text-align: center">
            <td colspan="2">
              <button class="btn btn-primary" id="btn-create" type="submit">Create Band</button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>

<script>
  function validate() {
    let name = document.getElementById('name').value;
    if(name.trim()==''){
      document.getElementById('validate').innerHTML = 'The name is required!'
      document.getElementById('validate').className = 'alert alert-danger';
    } else {
      document.getElementById('validate').innerHTML = ''
      document.getElementById('validate').className = '';
    }
  }
</script>
</body>
</html>
<%--<jsp:include page='../../bootstrap/footer.jsp'>--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>
