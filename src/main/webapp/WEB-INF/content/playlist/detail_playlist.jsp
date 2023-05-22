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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
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
            background: linear-gradient(to right, #5d6d7e, #566573);
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
            background: #ff8a65;
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
            background: #ff8a65;
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
            font-size: 35px;
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
            bottom: 20%;
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
            color: #fff;
            background: rgba(255, 255, 255, 0.2);
            outline: none;
            border-radius: 10px;
        }

        .right #auto i {
            margin-left: 8px;
        }

        #play {
            background: #ff8a65;
        }

        .right button:hover {
            background: #ff8a65;
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

    </style>
</head>
<body>
<div>

</div>
<div class="main">
    <div>
        <p id="logo"><i class="fa fa-music"></i>
            Music
        </p>
        <!-- Button trigger modal -->

        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
            ADD SONG
        </button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#removeModal">
            REMOVE SONG
        </button>

        <!-- Modal -->
        <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" action="/playlist?action=addSong&id=${playlist.id}">
                        <div class="modal-body">

                            <div>
                                <div class="form-group">
                                    <label style="color: white">Chon bai hat</label>
                                    <select class="form-control" name="addSong" id="categories" multiple>
                                        <c:forEach items="${song}" var="s">
                                            <option value="${s.id}">${s.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button class="btn btn-primary" id="btn-create" type="submit">Add Song</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="removeModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" action="/playlist?action=removeSong&id=${playlist.id}">
                        <div class="modal-body">
                            <div class="form-group">
                                <label style="color: white">Chon bai hat</label>
                                <select class="form-control" name="removeSong"  multiple>
                                    <c:forEach items="${songOfPlaylist}" var="s">
                                        <option value="${s.id}">${s.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button class="btn btn-primary"  type="submit">Remove Song</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--- left part --->
    <div class="left">
        <!--- song img --->
        <img id="track_image">
        <div class="volume">
            <p id="volume_show">90</p>
            <i onclick="mute_sound()" id="volume_icon" class="bi bi-megaphone-fill"></i>
            <%--            <i class="fa fa-volume-up" aria-hidden="true" onclick="mute_sound()" id="volume_icon"></i>--%>
            <input type="range" min="0" max="100" value="90" onchange="volume_change()" id="volume">
        </div>
    </div>
    <!--- right part --->
    <div class="right">

        <div class="show_song_no">
            <p id="present">1</p>
            <p>/</p>
            <p id="total">5</p>
        </div>
        <!--- song title & artist name --->
        <p id="title">title.mp3</p>
        <p id="artist">Artist name</p>
        <!--- middle part --->
        <div class="middle">
            <button onclick="previous_song()" id="pre"><i class="fa fa-step-backward" aria-hidden="true"></i></button>
            <button onclick="justplay()" id="play"><i class="bi bi-play-circle"></i></button>
            <button onclick="next_song()" id="next"><i class="fa fa-step-forward" aria-hidden="true"></i></button>
        </div>
        <!--- song duration part --->
        <div class="duration">
            <input type="range" min="0" max="100" value="0" id="duration_slider" onchange="change_duration()">
        </div>
        <button id="auto" onclick="autoplay_switch()">Auto play <i class="fa fa-circle-o-notch" aria-hidden="true"></i>
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
    let All_song=[];
    if ('${songOfPlaylist!=null}'){
        All_song = [
            <c:forEach items="${songOfPlaylist}" var="song">
            {
                id: "${songOfPlaylist.getId()}",
                name: "${songOfPlaylist.getName()}",
                mp3: "${songOfPlaylist.getSrc()}",
                img: "${songOfPlaylist.getAvatar()}"
            },
            </c:forEach>
        ];
    } else {
        All_song = [
            {
                name: "first song",
                mp3: "",
                img: ""
            }

        ];
    }

    console.log(All_song);

    // All functions


    // function load the track
    function load_track(index_no) {
        clearInterval(timer);
        reset_slider();

        track.src = All_song[index_no].mp3;
        title.innerHTML = All_song[index_no].name;
        track_image.src = All_song[index_no].img;
        artist.innerHTML = All_song[index_no].singer;
        track.load();

        timer = setInterval(range_slider, 1000);
        total.innerHTML = All_song.length;
        present.innerHTML = index_no + 1;
    }

    load_track(index_no);


    //mute sound function
    function mute_sound() {
        track.volume = 0;
        volume.value = 0;
        volume_show.innerHTML = 0;
    }


    // checking.. the song is playing or not
    function justplay() {
        if (Playing_song == false) {
            playsong();

        } else {
            pausesong();
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
            auto_play.style.background = "rgba(255,255,255,0.2)";
        } else {
            autoplay = 1;
            auto_play.style.background = "#FF8A65";
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

