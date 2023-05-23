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
            background: #d7d6d6;
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
<a href="/singers?action=back">BACK MENU</a>

<div class="main">
<%--    <p id="logo"><i class="fa fa-music"></i>Music</p>--%>
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
        <%--        <div class="show_song_no">--%>
        <%--            <p id="present">1</p>--%>
        <%--            <p>/</p>--%>
        <%--            <p id="total">5</p>--%>
        <%--        </div>--%>

        <!--- song title & artist name --->
        <p id="title"></p>
        <p id="artist"></p>
        <!--- middle part --->
        <div class="middle">
            <%--            <button onclick="previous_song()" id="pre"><i class="fa fa-step-backward" aria-hidden="true"></i></button>--%>
            <button onclick="justplay()" id="play">
                <svg style="color: #444646" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor"
                     class="bi bi-play-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M6.271 5.055a.5.5 0 0 1 .52.038l3.5 2.5a.5.5 0 0 1 0 .814l-3.5 2.5A.5.5 0 0 1 6 10.5v-5a.5.5 0 0 1 .271-.445z"/>
                </svg>
            </button>
        </div>
        <!--- song duration part --->
        <div class="duration">
            <input type="range" min="0" max="100" value="0" id="duration_slider" onchange="change_duration()">
        </div>
        <button id="auto" onclick="autoplay_switch()"><svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-repeat" viewBox="0 0 16 16">
            <path d="M11 5.466V4H5a4 4 0 0 0-3.584 5.777.5.5 0 1 1-.896.446A5 5 0 0 1 5 3h6V1.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384l-2.36 1.966a.25.25 0 0 1-.41-.192Zm3.81.086a.5.5 0 0 1 .67.225A5 5 0 0 1 11 13H5v1.466a.25.25 0 0 1-.41.192l-2.36-1.966a.25.25 0 0 1 0-.384l2.36-1.966a.25.25 0 0 1 .41.192V12h6a4 4 0 0 0 3.585-5.777.5.5 0 0 1 .225-.67Z"/>
        </svg>
        </button>
    </div>
</div>
<script>
    let song = {
        id: "${song.getId()}",
<%--<<<<<<< HEAD--%>
<%--        name: "${song.getName()}",--%>
<%--        avatar: "${song.getAvatar()}",--%>
<%--        mp3: "${song.getSrc()}"--%>
<%--=======--%>
        name:"${song.getName()}",
        avatar:"${song.getAvatar()}",
        mp3: "${song.getSrc()}",
        singer:"${song.getArtist()}"
    }


    console.log(song)

    // let previous = document.querySelector('#pre');
    let play = document.querySelector('#play');
    // let next = document.querySelector('#next');
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
    console.log("xuong day ko")

    // function load the track
    function load_track() {
        clearInterval(timer);
        reset_slider();

        track.src = song.mp3;
        title.innerHTML = song.name;
        track_image.src = song.avatar;

        artist.innerHTML = song.singer;
        track.load();

        timer = setInterval(range_slider, 1000);
    }

    load_track(index_no);


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
            recent_volume.value = 30;
            volume_show.innerHTML = "30";
            track.volume = recent_volume.value / 100;

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
            document.getElementById("play").innerHTML = ' <svg style="color: #444646" xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-play-circle" viewBox="0 0 16 16">' +
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
        play.innerHTML = '<i class="fa fa-pause" aria-hidden="true"></i>';
    }

    //pause song
    function pausesong() {
        track.pause();
        Playing_song = false;
        play.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
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
            auto_play.style.color = "#444646";
        } else {
            if (track.ended) {
                track.play();
            }
            autoplay = 1;
            auto_play.style.color = "#7732b4";
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
