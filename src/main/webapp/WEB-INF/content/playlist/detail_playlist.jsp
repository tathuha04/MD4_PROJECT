<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/18/2023
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            height: 100vh;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main {
            position: relative;
            height: 80%;
            width: 80%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(to right, #a18cd1, #a8a7a7);
        }

        .main button {
            padding: 10px 12px;
            margin: 0 10px;
        }

        .main #logo {
            position: absolute;
            top: 10px;
            left: 30px;
            font-size: 25px;
            color: #ccc;
        }

        .main #logo i {
            margin-right: 15px;
        }

        /* left & right part */
        .right,
        .left {
            position: relative;
            height: 100%;
            width: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        /* song image */
        .left img {
            height: 300px;
            width: 80%;
            border-radius: 15px;
            box-shadow: 1px 0px 20px 12px rgba(240, 240, 240, 0.2);
        }

        /* both range slider part */
        input[type="range"] {
            -webkit-appearance: none;
            width: 50%;
            outline: none;
            height: 2px;
            margin: 0 15px;
        }

        input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            height: 20px;
            width: 20px;
            background: #f1efef;
            border-radius: 50%;
            cursor: pointer;
        }

        .right input[type="range"] {
            width: 40%;
        }

        /* volume part */
        .left .volume {
            position: absolute;
            bottom: 10%;
            left: 0;
            width: 100%;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }

        .left .volume p {
            font-size: 15px;
        }

        .left .volume i {
            cursor: pointer;
            padding: 8px 12px;
            background: #f1efef;
        }

        .left .volume i:hover {
            background: rgba(245, 245, 245, 0.1);
        }

        .volume #volume_show {
            padding: 8px 12px;
            margin: 0 5px 0 0;
            background: rgba(245, 245, 245, 0.1);
        }

        /* right part */
        .right .middle {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .right .middle button {
            border: none;
            height: 70px;
            width: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            outline: none;
            transition: 0.5s;
            background: rgba(255, 255, 255, 0.1);
        }

        .right #title {
            position: absolute;
            top: 60px;
            left: 50%;
            transform: translateX(-50%);
            text-transform: capitalize;
            color: #fff;
            font-size: 20px;
        }

        .right #artist {
            position: absolute;
            top: 110px;
            left: 50%;
            transform: translateX(-50%);
            text-transform: capitalize;
            color: #fff;
            font-size: 18px;
        }

        .right .duration {
            position: absolute;
            bottom: 11%;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 20px;
            margin-top: 40px;
        }

        .right .duration p {
            color: #fff;
            font-size: 15px;
            margin-left: 20px;
        }

        .right #auto {
            font-size: 18px;
            cursor: pointer;
            margin-top: 45px;
            border: none;
            padding: 10px 14px;
            color: #444646;
            background: #D7D6D6;
            outline: none;
            border-radius: 10px;
        }

        .right #auto i {
            margin-left: 8px;
        }

        #play {
            background: #d7d6d6;
        }

        .right button:hover {
            background: #a8a7a7;
        }

        .right i:before {
            color: #fff;
            font-size: 20px;
        }

        .right .show_song_no {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 30px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 8px 12px;
            color: #fff;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.2);
        }

        .right .show_song_no p:nth-child(2) {
            margin: 0 5px;
        }

        #buttonAddSong {
            border-radius: 5px;
            border: none;
        }

        #buttonAddSong:hover {
            border-radius: 5px;
            border: none;
            background-color: #888888;
            color: #fafafa;
        }

        @-webkit-keyframes xoayvong {
            from {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
            }
            to {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -o-transform: rotate(360deg);
            }
        }

        /* Standard syntax */
        @keyframes xoayvong {
            from {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
            }
            to {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -o-transform: rotate(360deg);
            }
        }

        #track_image {
            animation: xoayvong 15s linear 0s infinite;
            -webkit-animation: xoayvong 15s linear 0s infinite;
            -moz-animation: xoayvong 15s linear 0s infinite;
            -o-animation: xoayvong 15s linear 0s infinite;
            border-radius: 50%;
            width: 250px;
            height: 250px;
        }

    </style>
</head>
<body>

<div class="main">
    <div>
        <c:if test="${user!=null}">
            <button style="background-color: #a18cd1; margin-top: 30px" type="button" class="btn btn-primary"
                    data-toggle="modal" data-target="#exampleModal"
                    data-whatever="${playlist.getId()}">
                <svg style="color: #3A3B3C;" xmlns="http://www.w3.org/2000/svg" width="35" height="35"
                     fill="currentColor" class="bi bi-plus-circle"
                     viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                </svg>
            </button>
            <button style="background-color: #a18cd1; margin-top: 30px" type="button" class="btn btn-primary" data-toggle="modal" data-target="#removeModal"
                    data-whatever="${playlist.getId()}">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-trash3"
                     viewBox="0 0 16 16">
                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                </svg>
            </button>
        </c:if>

    </div>
    <%--        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"--%>
    <%--             class="bi bi-music-note-beamed" viewBox="0 0 16 16">--%>
    <%--            <path d="M6 13c0 1.105-1.12 2-2.5 2S1 14.105 1 13c0-1.104 1.12-2 2.5-2s2.5.896 2.5 2zm9-2c0 1.105-1.12 2-2.5 2s-2.5-.895-2.5-2 1.12-2 2.5-2 2.5.895 2.5 2z"/>--%>
    <%--            <path fill-rule="evenodd" d="M14 11V2h1v9h-1zM6 3v10H5V3h1z"/>--%>
    <%--            <path d="M5 2.905a1 1 0 0 1 .9-.995l8-.8a1 1 0 0 1 1.1.995V3L5 4V2.905z"/>--%>
    <%--        </svg>--%>

    <%--        ///// modal--%>
    <%--<<<<<<< HEAD--%>
    <%--    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"--%>
    <%--            data-whatever="${playlist.getId()}">--%>
    <%--        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-plus-circle"--%>
    <%--             viewBox="0 0 16 16">--%>
    <%--            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>--%>
    <%--            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>--%>
    <%--        </svg>--%>
    <%--        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"--%>
    <%--             class="bi bi-file-earmark-music" viewBox="0 0 16 16">--%>
    <%--            <path d="M11 6.64a1 1 0 0 0-1.243-.97l-1 .25A1 1 0 0 0 8 6.89v4.306A2.572 2.572 0 0 0 7 11c-.5 0-.974.134-1.338.377-.36.24-.662.628-.662 1.123s.301.883.662 1.123c.364.243.839.377 1.338.377.5 0 .974-.134 1.338-.377.36-.24.662-.628.662-1.123V8.89l2-.5V6.64z"/>--%>
    <%--            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>--%>
    <%--        </svg>--%>
    <%--    </button>--%>
    <%--=======--%>


    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/playlist?action=addSong&idPLL=${playlist.getId()}" method="post">
                        <div class="form-group">
                            <label class="col-form-label">Enter the name song: </label>
                            <input oninput="actionSearch()" type="text" class="form-control" id="search">

                        </div>
                        <div class="form-group">
                            <label class="col-form-label">List Song :</label>
                            <table class="table">
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">NAME</th>
                                    <th scope="col"></th>
                                </tr>
                                <tbody id="draw">

                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="removeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/playlist?action=removeSong&idPLL=${playlist.getId()}" method="post">
                        <div class="form-group">
                            <a href=""></a>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">List Song :</label>
                            <table class="table">
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">NAME</th>
                                    <th scope="col"></th>
                                </tr>
                                <tbody id="draw_remove">

                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--        /////end modal--%>

    <!--- left part --->
    <div class="left">
        <!--- song img --->
        <img id="track_image">
        <div class="volume">
            <p id="volume_show">90</p>
            <svg onclick="mute_sound()" id="volume_icon" xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                 fill="currentColor" class="bi bi-volume-up" viewBox="0 0 16 16">
                <path d="M11.536 14.01A8.473 8.473 0 0 0 14.026 8a8.473 8.473 0 0 0-2.49-6.01l-.708.707A7.476 7.476 0 0 1 13.025 8c0 2.071-.84 3.946-2.197 5.303l.708.707z"/>
                <path d="M10.121 12.596A6.48 6.48 0 0 0 12.025 8a6.48 6.48 0 0 0-1.904-4.596l-.707.707A5.483 5.483 0 0 1 11.025 8a5.483 5.483 0 0 1-1.61 3.89l.706.706z"/>
                <path d="M10.025 8a4.486 4.486 0 0 1-1.318 3.182L8 10.475A3.489 3.489 0 0 0 9.025 8c0-.966-.392-1.841-1.025-2.475l.707-.707A4.486 4.486 0 0 1 10.025 8zM7 4a.5.5 0 0 0-.812-.39L3.825 5.5H1.5A.5.5 0 0 0 1 6v4a.5.5 0 0 0 .5.5h2.325l2.363 1.89A.5.5 0 0 0 7 12V4zM4.312 6.39 6 5.04v5.92L4.312 9.61A.5.5 0 0 0 4 9.5H2v-3h2a.5.5 0 0 0 .312-.11z"/>
            </svg>
            <input type="range" min="0" max="100" value="90" onchange="volume_change()" id="volume">
        </div>
    </div>
    <!--- right part --->
    <div class="right">

        <div class="show_song_no">
            <p id="present">1</p>
            <p>/</p>
            <p id="total"></p>
        </div>
        <!--- song title & artist name --->
        <p id="title"></p>
        <p id="artist"></p>
        <!--- middle part --->
        <div class="middle">
            <button onclick="previous_song()" id="pre">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor"
                     style="color: #444646" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                          d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                </svg>
            </button>
            <button onclick="justplay()" id="play">

                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor"
                     class="bi bi-play-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>
                </svg>

            </button>
            <button onclick="next_song()" id="next">
                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor"
                     style="color: #444646" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                          d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
                </svg>
            </button>
        </div>
        <!--- song duration part --->
        <div class="duration">
            <input type="range" min="0" max="100" value="0" id="duration_slider" onchange="change_duration()">
        </div>
        <button id="auto" onclick="autoplay_switch()">
            <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-repeat"
                 viewBox="0 0 16 16">
                <path d="M11 5.466V4H5a4 4 0 0 0-3.584 5.777.5.5 0 1 1-.896.446A5 5 0 0 1 5 3h6V1.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384l-2.36 1.966a.25.25 0 0 1-.41-.192Zm3.81.086a.5.5 0 0 1 .67.225A5 5 0 0 1 11 13H5v1.466a.25.25 0 0 1-.41.192l-2.36-1.966a.25.25 0 0 1 0-.384l2.36-1.966a.25.25 0 0 1 .41.192V12h6a4 4 0 0 0 3.585-5.777.5.5 0 0 1 .225-.67Z"/>
            </svg>
        </button>
    </div>


</div>
<script>

    let previous = document.querySelector('#pre');
    let play = document.querySelector('#play');
    let next = document.querySelector('#next');
    let title = document.querySelector('#title');
    let recent_volume = document.querySelector('#volume');
    let volume_show = document.querySelector('#volume_show');
    let slider = document.querySelector('#duration_slider');
    let show_duration = document.querySelector('#show_duration');
    let track_image = document.querySelector('#track_image');
    let auto_play = document.querySelector('#auto');
    let present = document.querySelector('#present');
    let total = document.querySelector('#total');
    let artist = document.querySelector('#artist');


    let timer;
    let autoplay = 0;

    let index_no = 0;
    let Playing_song = false;

    //create a audio Element
    let track = document.createElement('audio');


    //All songs list
    <%--let All_song = [];--%>

    <%--for (let i = 0; i < '${song.size()}'; i++) {--%>
    <%--    console.log(i);--%>
    <%--    console.log('${song.get(i).name}');--%>
    <%--    All_song.push({--%>
    <%--        name: '${song.get(i).name}',--%>
    <%--        path: '${song.get(i).src}',--%>
    <%--        img: '${song.get(i).avatar}',--%>
    <%--        singer:"1"--%>
    <%--    });--%>

    <%--};--%>
    console.log('${song.size()}');
    let All_song = [
        <c:forEach items="${song}" var="song">
        {
            id: "${song.getId()}",
            name: "${song.getName()}",
            mp3: "${song.getSrc()}",
            img: "${song.getAvatar()}"
        },
        </c:forEach>
    ];
    console.log("all song ----->", All_song);


    let listSongOfPlaylist = [
        <c:forEach items="${songOfPlaylist}" var="song">
        {
            id: "${song.getId()}",
            name: "${song.getName()}",
            mp3: "${song.getSrc()}",
            img: "${song.getAvatar()}"
        },
        </c:forEach>
    ]
    console.log("songOfPlaylist  ----->", listSongOfPlaylist);

    // All functions


    function drawTable() {
        let draw_Table = "";
        for (let i = 0; i < All_song.length; i++) {
            draw_Table += "<tr >" +
                "<td >" + All_song[i].id + "</td>" +
                "<td>" + All_song[i].name + "</td>" +
                "<td>" + '<button id="buttonAddSong" type="submit" name="idSong" value="' + All_song[i].id + '">ADD</button>' + "</td>" +
                "</tr>"
        }
        document.getElementById("draw").innerHTML = draw_Table;
        console.log(draw_Table)
    }

    drawTable();

    // function load the track
    function load_track(index_no) {
        clearInterval(timer);
        reset_slider();

        track.src = listSongOfPlaylist[index_no].mp3;
        title.innerHTML = listSongOfPlaylist[index_no].name;
        track_image.src = listSongOfPlaylist[index_no].img;
        // artist.innerHTML = listSongOfPlaylist[index_no].singer;
        track.load();

        timer = setInterval(range_slider, 1000);
        total.innerHTML = listSongOfPlaylist.length;
        present.innerHTML = index_no + 1;
    }

    ///////// search

    let listSearchSong = [];
    // function drawTable() {
    //     let drawTable = '';
    //     for (let i = 0; i < All_song.length; i++) {
    //         // drawTable +=
    //         //     '<tr>' +
    //         //     '<td>' + listSongAll[i].id + '</td>' +
    //         //     '<td>' + listSongAll[i].name + '</td>' +
    //         //     '<td>' +
    //         //     '<button name="idSong" type="submit" value="' + listSongAll[i].id + '">Add</button>' +
    //         //     '</td>' +
    //         //
    //         //     '</tr>'
    //
    // //     }
    //     document.getElementById('drawTable').innerHTML = drawTable;
    //     console.log('drawTable ---->', drawTable)
    // }


    drawTable();
    // =======
    //     // function myFunction() {
    //     //     var x = document.getElementById("mySelect").value;
    //     //     document.getElementById("demo").innerHTML = "Bạn đã chọn xe: " + x;
    //     // }
    //     let listSearchSong = [];
    // >>>>>>> dev

    function actionSearch() {
        listSearchSong = [];
        let search = document.getElementById('search').value;
        console.log(
        );
        //TÌM KIẾM TUYỆT ĐỐI ĐÚNG CẢ VỚI CHỮ HOA VÀ CHỮ THƯỜNG
        // if(search.trim()===''){
        //     showListStudent();
        //     return;
        // } else {
        //     for (let i = 0; i < studentsList.length; i++) {
        //         if(search.toLowerCase()===studentsList[i].toLowerCase()){
        //             listStudentSearch.push(studentsList[i])
        //         }
        //     }
        // }

        //TÌM KIẾM TƯƠNG ĐỐI
        if (search.trim() === '') {
            drawTable();
            return
        } else {
            for (let i = 0; i < All_song.length; i++) {
                if (All_song[i].name.search(search) != -1) {
                    console.log('vao if', i)
                    listSearchSong.push(All_song[i])
                }
            }
        }
        showListSearch();
    }

    function showListSearch() {
        let drawTable = '';
        for (let i = 0; i < listSearchSong.length; i++) {
            // let j = i+1;
            //Cách 1: Dùng cách ' ' thông thường biding biến qua ++
            drawTable +=
                '<tr>' +
                '<td>' + listSearchSong[i].id + '</td>' +
                '<td>' + listSearchSong[i].name + '</td>' +
                '<td>' +
                '<button name="idSong" type="submit" value="' + listSearchSong[i].id + '">Add</button>' +
                '</td>' +

                '</tr>'

            //Cách 2: Dùng string template `` biding biến qua
            <%--drawTable += `<tr>--%>
            <%--        <td>${i + 1}</td>--%>
            <%--        <td>${listStudentSearch[i]}</td>--%>
            <%--        <td><button style="background-color: blue; color: white" onclick="updateStudent(${i})">Edit</button></td>--%>
            <%--        <td><button style="background-color: red; color: white" onclick="deleteStudent(${i})">Delete</button></td>--%>
            <%--        </tr>`--%>
        }
        document.getElementById('draw').innerHTML = drawTable;
        console.log(
            'drawtTable Search', drawTable
        )
    }

    load_track(index_no);

    function drawRemoveTable() {
        let draw_Table = "";
        for (let i = 0; i < listSongOfPlaylist.length; i++) {
            draw_Table += "<tr >" +
                "<td >" + listSongOfPlaylist[i].id + "</td>" +
                "<td>" + listSongOfPlaylist[i].name + "</td>" +
                "<td>" +
                '<button  type="submit" name="idSong" value="' + listSongOfPlaylist[i].id + '">REMOVE</button>' +
                "</td>" +
                "</tr>"
        }
        document.getElementById("draw_remove").innerHTML = draw_Table;
    }

    drawRemoveTable();


    //mute sound function
    let mute = false;

    function mute_sound() {
        mute = !mute;
        if (mute) {
            document.getElementById("volume_icon").innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-volume-mute-fill" viewBox="0 0 16 16">' +
                '<path d="M6.717 3.55A.5.5 0 0 1 7 4v8a.5.5 0 0 1-.812.39L3.825 10.5H1.5A.5.5 0 0 1 1 10V6a.5.5 0 0 1 .5-.5h2.325l2.363-1.89a.5.5 0 0 1 .529-.06zm7.137 2.096a.5.5 0 0 1 0 .708L12.207 8l1.647 1.646a.5.5 0 0 1-.708.708L11.5 8.707l-1.646 1.647a.5.5 0 0 1-.708-.708L10.793 8 9.146 6.354a.5.5 0 1 1 .708-.708L11.5 7.293l1.646-1.647a.5.5 0 0 1 .708 0z"/>' +
                '</svg>';
            track.volume = 0;
            volume_show.innerHTML = "0";
            recent_volume.value = 0;
        } else {
            document.getElementById("volume_icon").innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-volume-up" viewBox="0 0 16 16">' +
                '<path d="M11.536 14.01A8.473 8.473 0 0 0 14.026 8a8.473 8.473 0 0 0-2.49-6.01l-.708.707A7.476 7.476 0 0 1 13.025 8c0 2.071-.84 3.946-2.197 5.303l.708.707z"/>' +
                '<path d="M10.121 12.596A6.48 6.48 0 0 0 12.025 8a6.48 6.48 0 0 0-1.904-4.596l-.707.707A5.483 5.483 0 0 1 11.025 8a5.483 5.483 0 0 1-1.61 3.89l.706.706z"/>' +
                '<path d="M10.025 8a4.486 4.486 0 0 1-1.318 3.182L8 10.475A3.489 3.489 0 0 0 9.025 8c0-.966-.392-1.841-1.025-2.475l.707-.707A4.486 4.486 0 0 1 10.025 8zM7 4a.5.5 0 0 0-.812-.39L3.825 5.5H1.5A.5.5 0 0 0 1 6v4a.5.5 0 0 0 .5.5h2.325l2.363 1.89A.5.5 0 0 0 7 12V4zM4.312 6.39 6 5.04v5.92L4.312 9.61A.5.5 0 0 0 4 9.5H2v-3h2a.5.5 0 0 0 .312-.11z"/>' +
                +'</svg>';
            volume_show.innerHTML = "30";
            track.volume = recent_volume.value / 100;
            recent_volume.value = 30;
        }
    }


    // checking.. the song is playing or not
    function justplay() {
        if (Playing_song == false) {
            playsong();
            document.getElementById("play").innerHTML = '<svg style="color: #7732b4" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-pause-circle" viewBox="0 0 16 16">'
                + '<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
                + '<path d="M5 6.25a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5zm3.5 0a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5z"/>' +
                '</svg>';
        } else {
            pausesong();
            document.getElementById("play").innerHTML = ' <svg style="color: #7732b4" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-play-circle" viewBox="0 0 16 16">' +
                '<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>' +
                '<path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>' +
                '</svg>';

        }
    }


    // reset song slider
    function reset_slider() {
        slider.value = 0;
    }

    // play song
    function playsong() {
        track.play();
        Playing_song = true;
        // play.innerHTML = '<i class="fa fa-pause" aria-hidden="true"></i>';
        document.getElementById("play").innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-pause-circle" viewBox="0 0 16 16">'
            + '<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
            + '<path d="M5 6.25a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5zm3.5 0a1.25 1.25 0 1 1 2.5 0v3.5a1.25 1.25 0 1 1-2.5 0v-3.5z"/>' +
            '</svg>';
    }

    //pause song
    function pausesong() {
        track.pause();
        Playing_song = false;
        play.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
    }


    // next song
    function next_song() {

        if (index_no < All_song.length - 1) {
            index_no += 1;
            load_track(index_no);
            playsong();
        } else {
            index_no = 0;
            load_track(index_no);
            playsong();

        }
    }


    // previous song
    function previous_song() {
        if (index_no > 0) {
            index_no -= 1;
            load_track(index_no);
            playsong();

        } else {
            index_no = All_song.length;
            load_track(index_no);
            playsong();
        }
    }


    // change volume
    function volume_change() {
        volume_show.innerHTML = recent_volume.value;
        track.volume = recent_volume.value / 100;
    }

    // change slider position
    function change_duration() {
        slider_position = track.duration * (slider.value / 100);
        track.currentTime = slider_position;
    }

    // autoplay function
    function autoplay_switch() {
        console.log('auto play')
        if (autoplay == 1) {
            autoplay = 0;
            auto_play.style.background = "#444646";
        } else {
            autoplay = 1;
            auto_play.style.background = "#7732b4";
        }
    }


    function range_slider() {
        let position = 0;

        // update slider position
        if (!isNaN(track.duration)) {
            position = track.currentTime * (100 / track.duration);
            slider.value = position;
        }


        // function will run when the song is over
        if (track.ended) {
            play.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
            if (autoplay == 1) {
                index_no += 1;
                load_track(index_no);
                playsong();
            }
        }
    }
</script>
</body>
</html>

