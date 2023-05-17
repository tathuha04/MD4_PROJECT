<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/05/2023
  Time: 8:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        @media (min-width: 1025px) {
            .h-custom {
                height: 150vh !important;
            }
        }
    </style>
</head>
<body>
<section class="h-100 h-custom" style="background-color: #3B1048;">
    <div class="container py-5 ">
        <div class="row d-flex justify-content-center align-items-center ">
            <div class="col-lg-8 col-xl-6">
                <div class="card rounded-3">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp"
                         class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                         alt="Sample photo">
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Registration Info</h3>
                        <div class="container">
                            <div class="row">
                                <div class="col-12" style="margin: auto">
                                    <form class="px-md-2" method="post">
                                        <div class="form-outline mb-4">
                                            <input type="text" class="form-control" name="name"/>
                                            <label class="form-label" >Name</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" class="form-control" name="username"/>
                                            <label class="form-label">UserName</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" class="form-control" name="email"/>
                                            <label class="form-label">Email</label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="password" class="form-control" name="password"/>
                                            <label class="form-label">Password</label>
                                        </div>
                                        <button type="submit" class="btn btn-success btn-lg mb-1">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<!-- end document-->
