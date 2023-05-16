<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2023
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <link rel="stylesheet" href="style.css">

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <title>Admin Dashboard Panel</title>
    <style>
        /* ===== Google Font Import - Poppins ===== */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        :root {
            /* ===== Colors ===== */
            --primary-color: #fff;
            --panel-color: rgb(34, 26, 45);
            --text-color: #fff;
            --black-light-color: rgb(218, 218, 218);
            --border-color: #e6e5e5;
            --toggle-color: #DDD;
            --box1-color: #4DA3FF;
            --box2-color: #FFE6AC;
            --box3-color: #E7D1FC;
            --title-icon-color: #fff;

            /* ====== Transition ====== */
            --tran-05: all 0.5s ease;
            --tran-03: all 0.3s ease;
            --tran-03: all 0.2s ease;
        }

        body {
            min-height: 100vh;
            background-color: var(--primary-color);
        }

        body.dark {
            --primary-color: #3A3B3C;
            --panel-color: #242526;
            --text-color: #CCC;
            --black-light-color: #CCC;
            --border-color: #4D4C4C;
            --toggle-color: #FFF;
            --box1-color: #3A3B3C;
            --box2-color: #3A3B3C;
            --box3-color: #3A3B3C;
            --title-icon-color: #CCC;
        }

        /* === Custom Scroll Bar CSS === */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 12px;
            transition: all 0.3s ease;
        }


        body.dark::-webkit-scrollbar-thumb:hover,
        body.dark .activity-data::-webkit-scrollbar-thumb:hover {
            background: #3A3B3C;
        }

        nav {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            padding: 10px 14px;
            background-color: var(--panel-color);
            border: none;
            transition: var(--tran-05);
        }

        nav.close {
            width: 73px;
        }

        nav .logo-name {
            display: flex;
            align-items: center;
        }

        nav .logo-image {
            display: flex;
            justify-content: center;
            min-width: 45px;
        }

        nav .logo-image img {
            width: 40px;
            object-fit: cover;
            border-radius: 50%;
        }

        nav .logo-name .logo_name {
            font-size: 22px;
            font-weight: 600;
            color: var(--text-color);
            margin-left: 14px;
            transition: var(--tran-05);
        }

        nav.close .logo_name {
            opacity: 0;
            pointer-events: none;
        }

        nav .menu-items {
            margin-top: 40px;
            height: calc(100% - 90px);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .menu-items li {
            list-style: none;
        }

        .menu-items li a {
            display: flex;
            align-items: center;
            height: 50px;
            text-decoration: none;
            position: relative;
        }

        .nav-links li a:hover:before {
            content: "";
            position: absolute;
            left: -7px;
            height: 5px;
            width: 5px;
            border-radius: 50%;
            background-color: var(--primary-color);
        }

        body.dark li a:hover:before {
            background-color: var(--text-color);
        }

        .menu-items li a img {
            margin-right: 10px;
            font-size: 24px;
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
        }

        .menu-items li a .link-name {
            font-size: 18px;
            font-weight: 400;
            color: var(--black-light-color);
            transition: var(--tran-05);
        }

        nav.close li a .link-name {
            opacity: 0;
            pointer-events: none;
        }

        .nav-links li a:hover img,
        .nav-links li a:hover .link-name {
            color: var(--primary-color);
        }

        body.dark .nav-links li a:hover img,
        body.dark .nav-links li a:hover .link-name {
            color: var(--text-color);
        }

        .menu-items .logout-mode {
            padding-top: 10px;
            border-top: 1px solid var(--border-color);
        }

        .menu-items .mode {
            display: flex;
            align-items: center;
            white-space: nowrap;
        }

        .menu-items .mode-toggle {
            position: absolute;
            right: 14px;
            height: 50px;
            min-width: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .mode-toggle .switch {
            position: relative;
            display: inline-block;
            height: 22px;
            width: 40px;
            border-radius: 25px;
            background-color: var(--toggle-color);
        }

        .switch:before {
            content: "";
            position: absolute;
            left: 5px;
            top: 50%;
            transform: translateY(-50%);
            height: 15px;
            width: 15px;
            background-color: var(--panel-color);
            border-radius: 50%;
            transition: var(--tran-03);
        }

        body.dark .switch:before {
            left: 20px;
        }

        .dashboard-footer {
            position: relative;
            left: 250px;
            background-color: rgb(34, 26, 45);
            min-height: 200px;
            width: calc(100% - 250px);
            padding: 10px 14px;
            transition: var(--tran-05);
        }

        nav.close ~ .dashboard-footer {
            left: 73px;
            width: calc(100% - 73px);
        }

        .dashboard .top {
            position: fixed;
            top: 0;
            left: 250px;
            display: flex;
            width: calc(100% - 250px);
            justify-content: space-between;
            align-items: center;
            padding: 10px 14px;
            background-color: #170F23;
            transition: var(--tran-05);
            z-index: 10;
        }

        nav.close ~ .dashboard .top {
            left: 73px;
            width: calc(100% - 73px);
        }

        .dashboard .top .sidebar-toggle {
            font-size: 26px;
            color: var(--text-color);
            cursor: pointer;
        }

        .dashboard .top .search-box {
            position: relative;
            height: 45px;
            max-width: 400px;
            width: 100%;
            margin: 0 30px;
        }

        .top .search-box input {
            position: absolute;
            border: none;
            background-color: #2F2739;
            padding: 0 25px 0 50px;
            border-radius: 25px;
            height: 100%;
            width: 100%;
            color: #ffffff;
            font-size: 15px;
            font-weight: 400;
            outline: none;
        }

        .top .search-box i {
            position: absolute;
            left: 15px;
            font-size: 22px;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            color: var(--black-light-color);
        }

        .top img {
            width: 40px;
            border-radius: 50%;
        }

        .dash-content .title i {
            position: relative;
            height: 35px;
            width: 35px;
            background-color: var(--primary-color);
            border-radius: 6px;
            color: var(--title-icon-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .boxes .box i {
            font-size: 35px;
            color: var(--text-color);
        }

        .dash-content .activity .activity-data {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .activity .activity-data {
            display: flex;
        }
        .activity-data .data-title {
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }

        @media (max-width: 1000px) {
            nav {
                width: 73px;
            }

            .activity .activity-data {
                overflow-X: scroll;
            }
        }

        @media (max-width: 400px) {
            nav {
                width: 0px;
            }

        }

        div.gallery {
            margin: 10px;
            float: left;
            width: 95px;
        }

        div.gallery img {
            width: 100%;
            height: 55px;
            border-radius: 15px;

        }

        div.desc {
            padding: 15px;
            text-align: center;
        }
    </style>

</head>
<body>
<section class="dashboard-footer">
    <div class="activity">
        <div class="activity-data">
            <div class="data-title" style="text-align: center ">
                <p style="margin: 20px 0 30px 0">
                    Đối tác âm nhạc
                </p>
                <div class="row row-cols-1 row-cols-md-4 g-4">
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="data:image/png;base64,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" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/6/6e/Stone_Music_Entertainment_-_Logo.png" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://loopcentral.vn/uploads/images/bab01eed08076b4c63183e1423f61435.jpg" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://www.pngitem.com/pimgs/m/206-2068915_monstercat-monstercat-png-transparent-png.png" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://vilarcorp.com/wp-content/uploads/2022/12/RouteNote-4.jpg" alt="Mountains" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://www.musicbusinessworldwide.com/files/2020/09/Fuga.jpg" alt="Mountains" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://www.musicbusinessworldwide.com/files/2020/09/Fuga.jpg" alt="Mountains" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://www.musicbusinessworldwide.com/files/2020/09/Fuga.jpg" alt="Mountains" class="card-img-top" alt="...">
                        </div>
                    </div>
                    <div class="col gallery">
                        <div class="card h-100">
                            <img src="https://www.musicbusinessworldwide.com/files/2020/09/Fuga.jpg" alt="Mountains" class="card-img-top" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
