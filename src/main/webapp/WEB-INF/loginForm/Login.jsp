<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/05/2023
  Time: 8:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<section class="vh-100" style="background-color: #3B1048">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <h3 class="mb-5" style="font-size: 40px; color:gray">Sign in</h3>
<form method="post">
                        <div class="form-outline mb-4">
                            <input type="text" name="username" class="form-control form-control-lg" placeholder="Username" />

                        </div>

                        <div class="form-outline mb-4">
                            <input type="password" name="password" class="form-control form-control-lg" placeholder="Password"/>
                        </div>

                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-start mb-4">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                            <label class="form-check-label" for="form1Example3"> Remember password </label>
                        </div>

<%--                       <a href="/user?action=login">--%>
<%--                       --%>
<%--                       </a>--%>
                        <button class="btn btn-primary btn-lg btn-block" type="submit" style="width: 100%">Login</button>
                        <hr class="my-4">

                        <button class="btn btn-lg btn-block btn-primary" style="background-color: #dd4b39;width: 100%"
                                type="submit"><i class="fab fa-google me-2"></i> Sign in with google</button>
                        <button class="btn btn-lg btn-block btn-primary mb-2" style="background-color: #3b5998; margin-top: 10px; width: 100%"
                                type="submit"><i class="fab fa-facebook-f me-2"></i>Sign in with facebook</button>
</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
