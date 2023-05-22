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

        .dashboard {
            position: relative;
            left: 250px;
            background-color: #170F23;
            min-height: 100vh;
            width: calc(100% - 250px);
            padding: 10px 14px;
            transition: var(--tran-05);
        }

        nav.close ~ .dashboard {
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

        .dashboard .dash-content {
            padding-top: 50px;
        }

        .dash-content .title {
            display: flex;
            align-items: center;
            margin: 60px 0 30px 0;
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

        .dash-content .title .text {
            font-size: 24px;
            font-weight: 500;
            color: var(--text-color);
            margin-left: 10px;
        }

        .dash-content .boxes {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .dash-content .boxes .box {
            display: flex;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: calc(100% / 3 - 15px);
            padding: 15px 20px;
            background-color: var(--box1-color);
            transition: var(--tran-05);
        }

        .boxes .box i {
            font-size: 35px;
            color: var(--text-color);
        }

        .boxes .box .text {
            white-space: nowrap;
            font-size: 18px;
            font-weight: 500;
            color: var(--text-color);
        }

        .boxes .box .number {
            font-size: 40px;
            font-weight: 500;
            color: var(--text-color);
        }

        .boxes .box.box2 {
            background-color: var(--box2-color);
        }

        .boxes .box.box3 {
            background-color: var(--box3-color);
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

        .activity-data .data {
            display: flex;
            flex-direction: column;
            margin: 0 15px;
        }

        .activity-data .data-title {
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }

        .activity-data .data .data-list {
            font-size: 18px;
            font-weight: 400;
            margin-top: 20px;
            white-space: nowrap;
            color: var(--text-color);
        }

        @media (max-width: 1000px) {
            nav {
                width: 73px;
            }

            nav.close {
                width: 250px;
            }

            nav .logo_name {
                opacity: 0;
                pointer-events: none;
            }

            nav.close .logo_name {
                opacity: 1;
                pointer-events: auto;
            }

            nav li a .link-name {
                opacity: 0;
                pointer-events: none;
            }

            nav.close li a .link-name {
                opacity: 1;
                pointer-events: auto;
            }

            nav ~ .dashboard {
                left: 73px;
                width: calc(100% - 73px);
            }

            nav.close ~ .dashboard {
                left: 250px;
                width: calc(100% - 250px);
            }

            nav ~ .dashboard .top {
                left: 73px;
                width: calc(100% - 73px);
            }

            nav.close ~ .dashboard .top {
                left: 250px;
                width: calc(100% - 250px);
            }

            .activity .activity-data {
                overflow-X: scroll;
            }
        }

        @media (max-width: 780px) {
            .dash-content .boxes .box {
                width: calc(100% / 2 - 15px);
                margin-top: 15px;
            }
        }

        @media (max-width: 560px) {
            .dash-content .boxes .box {
                width: 100%;
            }
        }

        @media (max-width: 400px) {
            nav {
                width: 0px;
            }

            nav.close {
                width: 73px;
            }

            nav .logo_name {
                opacity: 0;
                pointer-events: none;
            }

            nav.close .logo_name {
                opacity: 0;
                pointer-events: none;
            }

            nav li a .link-name {
                opacity: 0;
                pointer-events: none;
            }

            nav.close li a .link-name {
                opacity: 0;
                pointer-events: none;
            }

            nav ~ .dashboard {
                left: 0;
                width: 100%;
            }

            nav.close ~ .dashboard {
                left: 73px;
                width: calc(100% - 73px);
            }

            nav ~ .dashboard .top {
                left: 0;
                width: 100%;
            }

            nav.close ~ .dashboard .top {
                left: 0;
                width: 100%;
            }
        }
    </style>

</head>
<body>
<nav>
    <div class="logo-name">
        <span class="logo_name">
            <span style="color: rgb(0,157,220)">
                Z
            </span>
            <span style="color: rgb(73,169,66);margin-left: -5px">
               i
            </span>
            <span style="color:rgb(244,123,32);margin-left: -5px">
                n
            </span>
            <span style="color:rgb(238,43,116);margin-left: -5px">
                g
            </span>
            <span>
                mp3
            </span>
        </span>
    </div>

    <div class="menu-items">
        <ul class="nav-links">
            <li><a href="#">
                <img src="https://img.icons8.com/dusk/64/circled.png" alt="circled"/>
                <span class="link-name">Khám phá</span>
            </a></li>
            <li><a href="#">
                <img src="https://img.icons8.com/office/30/line-chart.png" alt="line-chart"/><span class="link-name">Zingchart</span>
            </a></li>
            <li><a href="/category?action=create">
                <img src="https://img.icons8.com/external-inkubators-gradient-inkubators/25/external-menu-email-inkubators-gradient-inkubators.png"
                     alt="external-menu-email-inkubators-gradient-inkubators"/>
                <span class="link-name">Chủ đề & thể loại</span>
            </a></li>
            <li><a href="/singers?action=singer">
                <img src="https://img.icons8.com/external-anggara-flat-anggara-putra/32/external-artist-media-anggara-flat-anggara-putra-2.png"
                     alt="external-artist-media-anggara-flat-anggara-putra-2"/>
                <span class="link-name">Singer </span>
            </a></li>
            <li><a href="/band?action=showband">
                <img src="https://img.icons8.com/fluency/48/music-band.png" alt="music-band"/>
                <span class="link-name">Band</span>
            </a></li>
            <li><a href="/playlist?action=showAllPlaylist">
                <img src="https://img.icons8.com/nolan/64/playlist.png" alt="playlist"/> <span
                    class="link-name">Playlist</span>
            </a></li>
        </ul>
    </div>
</nav>

<section class="dashboard">
    <div class="top">
        <i class="uil uil-bars sidebar-toggle"></i>
        <div style="font-size: 35px;width: 120px">
            <a style="color:rgb(93,87,101)">
                <i class="uil uil-arrow-left  "></i>
            </a>
            <a style="color:rgb(93,87,101)">
                <i class="uil uil-arrow-right "></i>
            </a>
        </div>


        <div class="search-box">
            <i class="uil uil-search"></i>
            <input type="text" placeholder="Tìm kiếm bài hát, nghệ sĩ, lời bài hát...">
        </div>
        <c:if test="${sessionScope['user']!=null}">
            <div>
                <p style="color: white">${sessionScope['user'].getName()}</p>
            </div>
            <div>
                <a href="/user?action=avatar"><img  src="${sessionScope['user'].getAvatar()}" alt=""> </a>
            </div>
            <div style="width: 200px;padding-left: 70px">
                <a href="/user?action=logout">
                    <button style="
            border-radius: 25px;
            height:45px;
            padding: 0 30px 0 30px;
            position: absolute;
            font-size: 15px;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            color:#FEFFFF;
            background-color: #9B4DE0;
            font-weight: 500">
                        Đăng xuất
                    </button>
                </a>
            </div>
        </c:if>
        <c:if test="${sessionScope['user']==null}">
            <div style="width: 200px;padding-left: 120px">
                <a href="/user?action=login">
                    <button style="
            border-radius: 25px;
            height:45px;
            padding: 0 30px 0 30px;
            position: absolute;
            font-size: 15px;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            color:#FEFFFF;
            background-color: #9B4DE0;
            font-weight: 500"
                    >
                        Đăng nhập
                    </button>
                </a>
            </div>
            <div style="width: 200px;padding-left: 70px">
                <a href="/user?action=register">
                    <button style="
            border-radius: 25px;
            height:45px;
            padding: 0 30px 0 30px;
            position: absolute;
            font-size: 15px;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            color:#FEFFFF;
            background-color: #9B4DE0;
            font-weight: 500"
                    >
                        Đăng kí
                    </button>
                </a>
            </div>
        </c:if>


    </div>

    <div class="dash-content">

    </div>
</section>


<script>
    const body = document.querySelector("body"),
        modeToggle = body.querySelector(".mode-toggle");
    sidebar = body.querySelector("nav");
    sidebarToggle = body.querySelector(".sidebar-toggle");

    // let getMode = localStorage.getItem("mode");
    // if(getMode && getMode ==="dark"){
    //   body.classList.toggle("dark");
    // }

    let getStatus = localStorage.getItem("status");
    if (getStatus && getStatus === "close") {
        sidebar.classList.toggle("close");
    }

    // modeToggle.addEventListener("click", () => {
    //     body.classList.toggle("dark");
    //     if (body.classList.contains("dark")) {
    //         localStorage.setItem("mode", "dark");
    //     } else {
    //         localStorage.setItem("mode", "light");
    //     }
    // });

    sidebarToggle.addEventListener("click", () => {
        sidebar.classList.toggle("close");
        if (sidebar.classList.contains("close")) {
            localStorage.setItem("status", "close");
        } else {
            localStorage.setItem("status", "open");
        }
    })
</script>
</body>
</html>
