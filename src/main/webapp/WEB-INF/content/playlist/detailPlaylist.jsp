<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/19/2023
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            -webkit-tap-highlight-color: transparent;
        }

        html, body, div, span, h1, h2, p, a, ol, li, audio, :before, :after {
            box-sizing: border-box;
            border: 0;
            font: inherit;
            font-size: 100%;
            margin: 0;
            padding: 0;
            vertical-align: baseline;
        }

        ol {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        ol li {
            margin: 0;
            display: block;
            list-style: decimal outside;
        }

        html, body {
            height: 100%;
        }

        a, a:focus, a:active, a:hover, a:visited {
            text-decoration: none;
        }

        a[href], a[href]:link, a[href]:active,
        a[href]:visited, a[href]:focus, a[href]:hover {
            outline: 0 none;
            text-decoration: underline;
        }

        /* << reset */
        /* page style */
        body {
            background: #ddd none;
            font-family: 'Helvetica', 'Arial', sans-serif;
            font-size: 14px;
            color: #eee;
        }

        .page {
            position: relative;
            margin: 0 auto;
            height: 100%;
            max-width: 400px;
        }

        .ellipsis {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .jk-player {
            min-height: 450px;
        }

        /* Audio Player */
        .player-wrap {
            position: relative;
            margin: 0 auto;
            padding: 0;
            min-width: 350px;
            overflow: hidden;
            background: #ecf0f1 none no-repeat center center;
            background-size: cover;
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", "Helvetica", "Arial", "Lucida Grande", sans-serif;
            line-height: 1.3em;
            font-size: 12pt;
            color: #fefefe;
            /* Playlist */
        }

        .player-wrap.view-port {
            max-width: 100vmin;
            max-height: 100vmin;
        }

        .player-wrap svg {
            position: relative;
            margin: 20%;
            width: 60%;
            height: 60%;
            fill: #fff;
        }

        .player-wrap .player {
            display: none;
        }

        .player-wrap .title-text {
            font-weight: bold;
            font-size: 1.16em;
        }

        .player-wrap .big-play-button,
        .player-wrap .big-pause-button,
        .player-wrap .play-button,
        .player-wrap .pause-button,
        .player-wrap .prev-button,
        .player-wrap .next-button,
        .player-wrap .playlist-button {
            position: absolute;
            left: 0;
            bottom: 0;
            display: block;
            width: 100%;
            height: 100%;
            vertical-align: top;
            text-align: center;
            cursor: pointer;
        }

        .player-wrap .big-play-button:before,
        .player-wrap .big-pause-button:before,
        .player-wrap .play-button:before,
        .player-wrap .pause-button:before,
        .player-wrap .prev-button:before,
        .player-wrap .next-button:before,
        .player-wrap .playlist-button:before {
            content: '';
            position: absolute;
            display: block;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
        }

        .player-wrap .prev-button,
        .player-wrap .next-button,
        .player-wrap .playlist-button {
            display: none;
        }

        .player-wrap .big-play-pause,
        .player-wrap .play-pause {
            position: relative;
            z-index: 2;
            display: none;
            overflow: hidden;
        }

        .player-wrap .big-play-pause {
            display: none;
            color: #fefefe;
        }

        .player-wrap .big-play-pause .big-play-button:before,
        .player-wrap .big-play-pause .big-pause-button:before {
            background-color: rgba(0, 0, 0, 0.6);
        }

        .player-wrap .big-play-pause:hover .big-play-button:before, .player-wrap .big-play-pause:hover .big-pause-button:before {
            background-color: #46aaff;
        }

        .player-wrap .big-play-pause:before {
            float: left;
            content: '';
            display: block;
            padding: 100% 0 0 0;
            width: 0;
            height: 0;
        }

        .player-wrap .big-play-button,
        .player-wrap .big-pause-button {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
        }

        .player-wrap .play-button:hover,
        .player-wrap .pause-button:hover,
        .player-wrap .prev-button:hover,
        .player-wrap .next-button:hover,
        .player-wrap .playlist-button:hover {
            color: #46aaff;
        }

        .player-wrap .play-button:hover:before,
        .player-wrap .pause-button:hover:before,
        .player-wrap .prev-button:hover:before,
        .player-wrap .next-button:hover:before,
        .player-wrap .playlist-button:hover:before {
            background-color: rgba(70, 170, 255, 0.1);
        }

        .player-wrap .next-button {
            left: auto;
            right: 0;
        }

        .player-wrap .playlist-button {
            color: #888;
            border-radius: 15%;
        }

        .player-wrap .seek-wrap {
            height: 1em;
            line-height: 1em;
        }

        .player-wrap .seek-bar {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        .player-wrap .current-time {
            float: left;
            font-size: .79em;
        }

        .player-wrap .duration-time {
            float: right;
            font-size: .79em;
        }

        .player-wrap audio,
        .player-wrap .big-pause-button,
        .player-wrap .pause-button {
            display: none;
        }

        .player-wrap .playlist-wrap {
            position: absolute;
            left: 0;
            top: 0;
            padding-top: 10.5em;
            width: 100%;
            height: 100%;
            overflow: hidden;
            color: #434546;
        }

        .player-wrap .playlist-wrap h2 {
            position: absolute;
            left: 0;
            top: 8em;
            padding: 0 1em;
            width: 100%;
            background-color: #f4f4f4;
            line-height: 2.5em;
            font-weight: bold;
            font-size: 1em;
        }

        .player-wrap .playlist-wrap ol {
            display: block;
            height: 100%;
            overflow: auto;
            background-color: #f4f4f4;
            counter-reset: track-counter;
            list-style: none inside;
        }

        .player-wrap .playlist-wrap li {
            margin: 0;
            border-top: 1px solid #e4e4e4;
            padding: 0;
        }

        .player-wrap .playlist-wrap a {
            display: block;
            padding: .25em 1em .25em 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .player-wrap .playlist-wrap li a:before {
            display: inline-block;
            content: counter(track-counter, decimal);
            counter-increment: track-counter;
            width: 2em;
            margin-right: 1em;
            text-align: right;
        }

        .player-wrap .playlist-wrap li,
        .player-wrap .playlist-wrap a[href]:link,
        .player-wrap .playlist-wrap a[href]:active,
        .player-wrap .playlist-wrap a[href]:visited {
            text-decoration: none;
            color: #434546;
        }

        .player-wrap .playlist-wrap a[href]:focus,
        .player-wrap .playlist-wrap a[href]:hover {
            background-color: #eee;
            text-decoration: none;
            color: #434546;
        }

        .player-wrap .playlist-wrap li.sel a[href] {
            background-color: #eee;
            color: #46aaff;
        }

        /* Cover Art (optional playlist) */
        .player-wrap.cover-art.enabled {
            min-height: 250px;
        }

        .player-wrap.cover-art.enabled:after, .player-wrap.cover-art.enabled:before {
            content: '';
            display: block;
            width: 0;
            height: 0;
        }

        .player-wrap.cover-art.enabled:before {
            float: left;
            padding: 100% 0 0 0;
        }

        .player-wrap.cover-art.enabled:after {
            clear: both;
        }

        .player-wrap.cover-art.enabled .artist-text {
            display: none;
        }

        .player-wrap.cover-art.enabled .player {
            position: absolute;
            left: 0;
            bottom: 0;
            display: block;
            padding: 10% 6% 4%;
            width: 100%;
            background: #434546;
            background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.35) 20%, rgba(0, 0, 0, 0.55) 50%, rgba(0, 0, 0, 0.6) 100%);
        }

        .player-wrap.cover-art.enabled .big-play-pause {
            position: absolute;
            left: 50%;
            bottom: 50%;
            display: block;
            margin: 0 0 -13% -13%;
            width: 26%;
            height: 26%;
        }

        .player-wrap.cover-art.enabled.list-view .big-play-pause,
        .player-wrap.cover-art.enabled .play-pause,
        .player-wrap.cover-art.enabled .prev-button,
        .player-wrap.cover-art.enabled .next-button,
        .player-wrap.cover-art.enabled .playlist-button {
            display: none;
        }

        .player-wrap.cover-art.enabled.list-view {
            background-position: center top;
            background-size: 100% auto;
        }

        .player-wrap.cover-art.enabled.list-view:before, .player-wrap.cover-art.enabled.list-view:after {
            height: 70px;
        }

        .player-wrap.cover-art.enabled.list-view .player {
            z-index: 1;
            top: 100%;
            bottom: auto;
            margin-top: -9em;
            padding: 0;
            height: 9em;
        }

        .player-wrap.cover-art.enabled.list-view .title-text {
            position: absolute;
            left: 0;
            bottom: 5.25em;
            padding: 0 6%;
            width: 100%;
        }

        .player-wrap.cover-art.enabled.list-view .controls {
            position: absolute;
            left: 0;
            bottom: 0;
            margin-top: 4%;
            padding: 2.5em 6% 0;
            width: 100%;
            height: 5em;
            background: #fff none;
            color: #434546;
            border-radius: 1em 1em 0 0;
        }

        .player-wrap.cover-art.enabled.list-view .play-pause,
        .player-wrap.cover-art.enabled.list-view .prev-button,
        .player-wrap.cover-art.enabled.list-view .next-button,
        .player-wrap.cover-art.enabled.list-view .playlist-button {
            position: absolute;
            top: 10%;
            display: block;
            width: 2em;
            height: 2em;
        }

        .player-wrap.cover-art.enabled.list-view .play-pause {
            left: 56%;
        }

        .player-wrap.cover-art.enabled.list-view .prev-button {
            left: 31%;
        }

        .player-wrap.cover-art.enabled.list-view .next-button {
            left: 79%;
        }

        .player-wrap.cover-art.enabled.list-view .playlist-button {
            left: 8%;
            background: none no-repeat center center;
            background-size: cover;
        }

        .player-wrap.cover-art.enabled.list-view .current-time,
        .player-wrap.cover-art.enabled.list-view .duration-time {
            color: #888;
        }

        .player-wrap.cover-art.enabled.list-view .playlist-wrap {
            position: absolute;
            left: 0;
            top: 100%;
            height: 100%;
            width: 100%;
            padding-top: 5em;
        }

        .player-wrap.cover-art.enabled.list-view.show-list .player {
            top: 5em;
        }

        .player-wrap.cover-art.enabled.list-view.show-list .player .playlist-button svg {
            display: none;
        }

        .player-wrap.cover-art.enabled.list-view.show-list .playlist-wrap {
            top: 0;
        }

        .player-wrap.cover-art.enabled.list-view .player,
        .player-wrap.cover-art.enabled.list-view .playlist-wrap {
            transition: top .2s ease;
        }

        /* Track View (optional playlist) */
        .player-wrap.track-view.enabled {
            background-position: -100% -100%;
            background-size: contain;
            border-radius: .5em;
            color: #434546;
        }

        .player-wrap.track-view.enabled:before, .player-wrap.track-view.enabled:after {
            display: none;
        }

        .player-wrap.track-view.enabled .player {
            position: relative;
            display: block;
            padding: 1em;
        }

        .player-wrap.track-view.enabled .player:after {
            content: '';
            display: block;
            clear: both;
        }

        .player-wrap.track-view.enabled .title-text {
            margin-left: 2.55em;
        }

        .player-wrap.track-view.enabled .artist-text {
            margin-left: 3em;
        }

        .player-wrap.track-view.enabled .play-pause {
            position: absolute;
            left: .5em;
            top: .5em;
            display: block;
            width: 3em;
            height: 3em;
        }

        .player-wrap.track-view.enabled .play-pause:hover {
            color: #46aaff;
        }

        .player-wrap.track-view.enabled .current-time,
        .player-wrap.track-view.enabled .duration-time {
            color: #888;
        }

        .player-wrap.track-view.enabled.list-view {
            height: 100%;
            min-height: 350px;
            background-position: 1em .5em;
            background-size: 7em 7em;
        }

        .player-wrap.track-view.enabled.list-view .player {
            position: absolute;
            z-index: 1;
            left: 0;
            top: 0;
            padding: 2em 1em 2.5em 9em;
            width: 100%;
            height: 8em;
            overflow: hidden;
        }

        .player-wrap.track-view.enabled.list-view .play-pause {
            left: 8.5em;
            top: 1.5em;
        }

        /* Button Only */
        .player-wrap.button-only.enabled {
            min-width: 0;
            background: transparent none !important;
        }

        .player-wrap.button-only.enabled .player,
        .player-wrap.button-only.enabled .playlist-wrap {
            display: none;
        }

        .player-wrap.button-only.enabled .big-play-pause {
            display: block;
            color: #434546;
        }

        .player-wrap.button-only.enabled .big-play-pause :before {
            background-color: #fff;
        }

        .player-wrap.button-only.enabled .big-play-pause :hover {
            color: #fefefe;
        }

        .player-wrap.button-only.enabled .big-play-pause :hover:before {
            background-color: #46aaff;
        }

        /* >> input[type=range] class: seek-bar */
        input.seek-bar[type=range] {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            overflow: visible;
            outline: 0 none;
            background-color: transparent;
            line-height: 1em;
            vertical-align: top;
            font-size: 1em;
            -webkit-appearance: none;
            cursor: pointer;
        }

        input.seek-bar[type=range]:focus {
            outline: 0 none;
        }

        input.seek-bar[type=range]::-webkit-slider-runnable-track {
            box-sizing: border-box;
            width: 98%;
            height: .125em;
            background-color: #fefefe;
            cursor: pointer;
            transition: all .2s ease;
        }

        input.seek-bar[type=range]::-webkit-slider-thumb {
            box-sizing: border-box;
            width: .5em;
            height: .5em;
            margin-top: -.175em;
            border-radius: .5em;
            background-color: #fefefe;
            -webkit-appearance: none;
        }

        .seek-wrap.sel input.seek-bar[type=range]::-webkit-slider-thumb,
        .seek-wrap:hover input.seek-bar[type=range]::-webkit-slider-thumb {
            margin-top: -.3em;
            margin-left: -.05em;
            width: .75em;
            height: .75em;
            background-color: #46aaff;
        }

        input.seek-bar[type=range]:focus::-webkit-slider-runnable-track {
            background-color: #fefefe;
        }

        input.seek-bar[type=range]::-moz-range-track {
            box-sizing: border-box;
            border: 0 solid #fefefe;
            width: 98%;
            height: .125em;
            background-color: #fefefe;
            border-radius: .125em;
            transition: all .2s ease;
        }

        input.seek-bar[type=range]::-moz-range-thumb {
            box-sizing: border-box;
            border: 0 solid #fefefe;
            width: .5em;
            height: .5em;
            background-color: #fefefe;
            border-radius: .5em;
        }

        .seek-wrap.sel input.seek-bar[type=range]::-moz-range-thumb,
        .seek-wrap:hover input.seek-bar[type=range]::-moz-range-thumb,
        input.seek-bar[type=range]::-moz-range-thumb:hover {
            margin-top: -.175em;
            margin-left: -.1em;
            width: .75em;
            height: .75em;
            background-color: #46aaff;
        }

        input.seek-bar[type=range]::-ms-track {
            box-sizing: border-box;
            border: 0 none;
            width: 99%;
            height: .125em;
            background-color: transparent;
            color: transparent;
            transition: all .2s ease;
        }

        input.seek-bar[type=range]::-ms-fill-lower {
            background-color: #fefefe;
            border-radius: .125em;
        }

        input.seek-bar[type=range]::-ms-fill-upper {
            background-color: #fefefe;
            border-radius: .125em;
        }

        input.seek-bar[type=range]::-ms-thumb {
            position: relative;
            margin-top: .1em;
            box-sizing: border-box;
            width: .5em;
            height: .5em;
            background-color: #fefefe;
            border-radius: .5em;
        }

        .seek-wrap.sel input.seek-bar[type=range]::-ms-thumb,
        .seek-wrap:hover input.seek-bar[type=range]::-ms-thumb {
            margin-top: -.01em;
            margin-left: -.1em;
            width: .75em;
            height: .75em;
            background-color: #46aaff;
        }

        input.seek-bar[type=range]:focus::-ms-fill-lower {
            background-color: #fefefe;
        }

        input.seek-bar[type=range]:focus::-ms-fill-upper {
            background-color: #fefefe;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-webkit-slider-runnable-track,
        .player-wrap.track-view input.seek-bar[type=range]::-webkit-slider-runnable-track {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.track-view input.seek-bar[type=range]::-webkit-slider-thumb {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view .seek-wrap.sel input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.cover-art.list-view .seek-wrap:hover input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.track-view .seek-wrap.sel input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.track-view .seek-wrap:hover input.seek-bar[type=range]::-webkit-slider-thumb {
            background-color: #46aaff;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]:focus::-webkit-slider-runnable-track,
        .player-wrap.track-view input.seek-bar[type=range]:focus::-webkit-slider-runnable-track {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-moz-range-track,
        .player-wrap.track-view input.seek-bar[type=range]::-moz-range-track {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.track-view input.seek-bar[type=range]::-moz-range-thumb {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view .seek-wrap.sel input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.cover-art.list-view .seek-wrap:hover input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-moz-range-thumb:hover,
        .player-wrap.track-view .seek-wrap.sel input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.track-view .seek-wrap:hover input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.track-view input.seek-bar[type=range]::-moz-range-thumb:hover {
            background-color: #46aaff;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-ms-track,
        .player-wrap.track-view input.seek-bar[type=range]::-ms-track {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-ms-fill-lower,
        .player-wrap.track-view input.seek-bar[type=range]::-ms-fill-lower {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-ms-fill-upper,
        .player-wrap.track-view input.seek-bar[type=range]::-ms-fill-upper {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.track-view input.seek-bar[type=range]::-ms-thumb {
            background-color: #434546;
        }

        .player-wrap.cover-art.list-view .seek-wrap.sel input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.cover-art.list-view .seek-wrap:hover input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.track-view .seek-wrap.sel input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.track-view .seek-wrap:hover input.seek-bar[type=range]::-ms-thumb {
            background-color: #46aaff;
        }

        /* << input[type=range] class: seek-bar */
        .player-wrap.dark {
            background-color: #333;
            color: #fefefe;
        }

        .player-wrap.dark .big-play-pause:hover .big-play-button:before, .player-wrap.dark .big-play-pause:hover .big-pause-button:before {
            background-color: #46aaff;
        }

        .player-wrap.dark .play-button:hover,
        .player-wrap.dark .pause-button:hover,
        .player-wrap.dark .prev-button:hover,
        .player-wrap.dark .next-button:hover,
        .player-wrap.dark .playlist-button:hover {
            color: #46aaff;
        }

        .player-wrap.dark .play-button:hover:before,
        .player-wrap.dark .pause-button:hover:before,
        .player-wrap.dark .prev-button:hover:before,
        .player-wrap.dark .next-button:hover:before,
        .player-wrap.dark .playlist-button:hover:before {
            background-color: rgba(70, 170, 255, 0.1);
        }

        .player-wrap.dark .playlist-button {
            color: #888;
        }

        .player-wrap.dark .playlist-wrap {
            color: #c9c9c9;
        }

        .player-wrap.dark .playlist-wrap h2, .player-wrap.dark .playlist-wrap ol {
            background-color: #292929;
        }

        .player-wrap.dark .playlist-wrap li {
            border-top: 1px solid #181818;
        }

        .player-wrap.dark .playlist-wrap a[href]:link,
        .player-wrap.dark .playlist-wrap a[href]:active,
        .player-wrap.dark .playlist-wrap a[href]:visited {
            color: #c9c9c9;
        }

        .player-wrap.dark .playlist-wrap a[href]:focus,
        .player-wrap.dark .playlist-wrap a[href]:hover {
            background-color: #292929;
            color: #fefefe;
        }

        .player-wrap.dark .playlist-wrap li.sel a[href] {
            background-color: #333;
            color: #46aaff;
        }

        .player-wrap.dark.cover-art.enabled .controls {
            background: #333 none;
            color: #fefefe;
        }

        .player-wrap.dark.cover-art.enabled .current-time,
        .player-wrap.dark.cover-art.enabled .duration-time {
            color: #888;
        }

        .player-wrap.dark.track-view.enabled {
            color: #fefefe;
        }

        .player-wrap.dark.track-view.enabled .play-pause:hover {
            color: #46aaff;
        }

        .player-wrap.dark.track-view.enabled .current-time,
        .player-wrap.dark.track-view.enabled .duration-time {
            color: #888;
        }

        .player-wrap.dark.button-only.enabled .big-play-pause {
            color: #fefefe;
        }

        .player-wrap.dark.button-only.enabled .big-play-pause :before {
            background-color: #333;
        }

        .player-wrap.dark.button-only.enabled .big-play-pause :hover {
            color: #fefefe;
        }

        .player-wrap.dark.button-only.enabled .big-play-pause :hover:before {
            background-color: #46aaff;
        }

        .player-wrap.dark input.seek-bar[type=range]::-webkit-slider-runnable-track {
            background-color: #fefefe;
        }

        .player-wrap.dark input.seek-bar[type=range]::-webkit-slider-thumb {
            background-color: #fefefe;
        }

        .player-wrap.dark .seek-wrap.sel input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.dark .seek-wrap:hover input.seek-bar[type=range]::-webkit-slider-thumb {
            background-color: #46aaff;
        }

        .player-wrap.dark input.seek-bar[type=range]:focus::-webkit-slider-runnable-track {
            background-color: #fefefe;
        }

        .player-wrap.dark input.seek-bar[type=range]::-moz-range-track {
            border: 0 solid #fefefe;
            background-color: #fefefe;
        }

        .player-wrap.dark input.seek-bar[type=range]::-moz-range-thumb {
            border: 0 solid #fefefe;
            background-color: #fefefe;
        }

        .player-wrap.dark .seek-wrap.sel input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.dark .seek-wrap:hover input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.dark input.seek-bar[type=range]::-moz-range-thumb:hover {
            background-color: #46aaff;
        }

        .player-wrap.dark input.seek-bar[type=range]::-ms-fill-lower {
            background-color: #fefefe;
        }

        .player-wrap.dark input.seek-bar[type=range]::-ms-fill-upper {
            background-color: #fefefe;
        }

        .player-wrap.dark input.seek-bar[type=range]::-ms-thumb {
            background-color: #fefefe;
        }

        .player-wrap.dark .seek-wrap.sel input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.dark .seek-wrap:hover input.seek-bar[type=range]::-ms-thumb {
            background-color: #46aaff;
        }

        .player-wrap.dark input.seek-bar[type=range]:focus::-ms-fill-lower {
            background-color: #fefefe;
        }

        .player-wrap.dark input.seek-bar[type=range]:focus::-ms-fill-upper {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-webkit-slider-runnable-track, .player-wrap.dark.track-view input.seek-bar[type=range]::-webkit-slider-runnable-track {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-webkit-slider-thumb, .player-wrap.dark.track-view input.seek-bar[type=range]::-webkit-slider-thumb {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view .seek-wrap.sel input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.dark.cover-art.list-view .seek-wrap:hover input.seek-bar[type=range]::-webkit-slider-thumb, .player-wrap.dark.track-view .seek-wrap.sel input.seek-bar[type=range]::-webkit-slider-thumb,
        .player-wrap.dark.track-view .seek-wrap:hover input.seek-bar[type=range]::-webkit-slider-thumb {
            background-color: #46aaff;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]:focus::-webkit-slider-runnable-track, .player-wrap.dark.track-view input.seek-bar[type=range]:focus::-webkit-slider-runnable-track {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-moz-range-track, .player-wrap.dark.track-view input.seek-bar[type=range]::-moz-range-track {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-moz-range-thumb, .player-wrap.dark.track-view input.seek-bar[type=range]::-moz-range-thumb {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view .seek-wrap.sel input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.dark.cover-art.list-view .seek-wrap:hover input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-moz-range-thumb:hover, .player-wrap.dark.track-view .seek-wrap.sel input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.dark.track-view .seek-wrap:hover input.seek-bar[type=range]::-moz-range-thumb,
        .player-wrap.dark.track-view input.seek-bar[type=range]::-moz-range-thumb:hover {
            background-color: #46aaff;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-ms-track, .player-wrap.dark.track-view input.seek-bar[type=range]::-ms-track {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-ms-fill-lower, .player-wrap.dark.track-view input.seek-bar[type=range]::-ms-fill-lower {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-ms-fill-upper, .player-wrap.dark.track-view input.seek-bar[type=range]::-ms-fill-upper {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view input.seek-bar[type=range]::-ms-thumb, .player-wrap.dark.track-view input.seek-bar[type=range]::-ms-thumb {
            background-color: #fefefe;
        }

        .player-wrap.dark.cover-art.list-view .seek-wrap.sel input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.dark.cover-art.list-view .seek-wrap:hover input.seek-bar[type=range]::-ms-thumb, .player-wrap.dark.track-view .seek-wrap.sel input.seek-bar[type=range]::-ms-thumb,
        .player-wrap.dark.track-view .seek-wrap:hover input.seek-bar[type=range]::-ms-thumb {
            background-color: #46aaff;
        }
    </style>
</head>
<body>
<div class="page">


    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Open modal for @fat</button>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
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
<%--    MOdal--%>










    <div class="jk-player">
        <div class="player-wrap track-view light" data-url="//archive.org/download/mythium/JLS_ATI.mp3"
             data-title="All This Is - Joe L.'s Studio" data-artist="Mythium"
             style="background-image: url('https://lh4.googleusercontent.com/-myR3sCeFB4k/AAAAAAAAAAI/AAAAAAAAAyA/jb6y3Wns6T8/photo.jpg');">
            <audio preload></audio>
            <div class="player">
                <p class="title-text ellipsis"></p>
                <p class="artist-text ellipsis"></p>
                <div class="controls">
                    <div class="play-pause">
                        <div class="play-button">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 150 150">
                                <path d="M43.3,11.1C36.6,7.1 30.3,9.6 30.3,18.6C30.3,27.6 30.3,121.3 30.3,131.7C30.3,142.1 35.6,144 43.6,139.7C51.6,134.7 133.5,87.5 141.5,83C149.3,78.5 149,72.5 141.5,68.2C134,63.8 52.2,16.4 43.3,11.1Z"/>
                            </svg>
                        </div>
                        <div class="pause-button">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
                                <rect width="18%" height="90%" x="22.5%" y="5%" rx="5%" ry="5%"/>
                                <rect width="18%" height="90%" x="62.5%" y="5%" rx="5%" ry="5%"/>
                            </svg>
                        </div>
                    </div>
                    <div class="prev-button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M8.7 12L22 18.9V5.1L8.7 12z"/>
                            <path d="M0 12l11.3 6.9V5.1L0 12z"/>
                        </svg>
                    </div>
                    <div class="next-button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M15.3 12L2 18.9V5.1L15.3 12z"/>
                            <path d="M24 12l-11.3 6.9V5.1L24 12z"/>
                        </svg>
                    </div>
                    <div class="playlist-button">
                        <svg viewBox="0 0 48 48">
                            <rect width="67%" height="13%" x="28%" y="19%" rx="5%" ry="5%"/>
                            <rect width="67%" height="13%" x="28%" y="45%" rx="5%" ry="5%"/>
                            <rect width="67%" height="13%" x="28%" y="71%" rx="5%" ry="5%"/>
                            <rect width="13%" height="13%" x="5%" y="19%" rx="6.5%" ry="7.5%"/>
                            <rect width="13%" height="13%" x="5%" y="45%" rx="6.5%" ry="7.5%"/>
                            <rect width="13%" height="13%" x="5%" y="71%" rx="6.5%" ry="7.5%"/>
                        </svg>
                    </div>
                    <div class="seek-wrap"><input type="range" min="0" max="100" step=".1" value="0" class="seek-bar">
                    </div>
                    <div class="current-time">0:00:00</div>
                    <div class="duration-time">0:00:00</div>
                </div>
            </div>
            <div class="big-play-pause">
                <div class="big-play-button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 150 150">
                        <path d="M43.3,11.1C36.6,7.1 30.3,9.6 30.3,18.6C30.3,27.6 30.3,121.3 30.3,131.7C30.3,142.1 35.6,144 43.6,139.7C51.6,134.7 133.5,87.5 141.5,83C149.3,78.5 149,72.5 141.5,68.2C134,63.8 52.2,16.4 43.3,11.1Z"/>
                    </svg>
                </div>
                <div class="big-pause-button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
                        <rect width="18%" height="90%" x="22.5%" y="5%" rx="5%" ry="5%"/>
                        <rect width="18%" height="90%" x="62.5%" y="5%" rx="5%" ry="5%"/>
                    </svg>
                </div>
            </div>
            <div class="playlist-wrap">
                <h2>Mythium</h2>
                <ol>
<%--                    <c:forEach items="${songlist}" var="sl">--%>
<%--                        <li><a href="//archive.org/download/mythium/JLS_ATI.mp3" data-artist="track 1">All This Is - Joe--%>
<%--                            L.'s Studio</a></li>--%>

<%--                    </c:forEach>--%>
                </ol>
            </div>

        </div>
    </div>
</div>
<script>
    let All_song = [
        <c:forEach items="${song}" var="song">
        {
            <%--id: "${song.getId()}",--%>
            name: "${song.getName()}",
            path: "${song.getSrc()}",
            img: "${song.getAvatar()}"
        },
        </c:forEach>
    ];
    var jsPlayer = document.querySelector('.player-wrap');
    if (jsPlayer) {
        jsPlayer = {
            wrap: jsPlayer,
            player: jsPlayer.querySelector('audio'),
            wrapList: (document.querySelector('.playlist-wrap') || {}),
            currentTime: (jsPlayer.querySelector('.current-time') || {}),
            durationTime: (jsPlayer.querySelector('.duration-time') || {}),
            seekBar: (jsPlayer.querySelector('.seek-bar') || {style: {}}),
            bigPlayButton: (jsPlayer.querySelector('.big-play-button') || {style: {}}),
            bigPauseButton: (jsPlayer.querySelector('.big-pause-button') || {style: {}}),
            playButton: (jsPlayer.querySelector('.play-button') || {style: {}}),
            pauseButton: (jsPlayer.querySelector('.pause-button') || {style: {}}),
            prevButton: (jsPlayer.querySelector('.prev-button') || {style: {}}),
            nextButton: (jsPlayer.querySelector('.next-button') || {style: {}}),
            playlistButton: (jsPlayer.querySelector('.playlist-button') || {style: {}}),
            titleText: (jsPlayer.querySelector('.title-text') || {style: {}}),
            artistText: (jsPlayer.querySelector('.artist-text') || {style: {}}),
            seekInterval: null,
            trackCount: 0,
            playing: false,
            playlist: All_song,
            tracks: [],
            idx: 0
        };

        jsPlayer.playClicked = function jsPlayerPlayClicked() {
            jsPlayer.bigPauseButton.style.display = 'block';
            jsPlayer.bigPlayButton.style.display = 'none';
            jsPlayer.pauseButton.style.display = 'block';
            jsPlayer.playButton.style.display = 'none';
            jsPlayer.playing = true;
            jsPlayer.player.play();
            jsPlayer.seekInterval = setInterval(jsPlayer.updateSeek, 500);
        };
        jsPlayer.pauseClicked = function jsPlayerPauseClicked() {
            clearInterval(jsPlayer.seekInterval);
            jsPlayer.bigPlayButton.style.display = 'block';
            jsPlayer.bigPauseButton.style.display = 'none';
            jsPlayer.playButton.style.display = 'block';
            jsPlayer.pauseButton.style.display = 'none';
            jsPlayer.playing = false;
            jsPlayer.player.pause();
        };
        jsPlayer.mediaEnded = function jsPlayerMediaEnded() {
            if (jsPlayer.idx + 1 < jsPlayer.trackCount) {
                jsPlayer.idx++;
                jsPlayer.playTrack(jsPlayer.idx);
            } else {
                jsPlayer.pauseClicked();
                jsPlayer.idx = 0;
                jsPlayer.loadTrack(jsPlayer.idx);
            }
        };
        jsPlayer.loadTracklist = function jsPlayerLoadPlaylist() {
            jsPlayer.playlist = jsPlayer.wrapList.tagName ? jsPlayer.wrapList.querySelectorAll('ol > li') : [];
            var len = jsPlayer.playlist.length,
                tmp, i;
            if (len > 0) {
                jsPlayer.wrap.classList.add('list-view');
                for (i = jsPlayer.trackCount; i < len; i++) {
                    if (!jsPlayer.playlist[i].dataset) {
                        jsPlayer.playlist[i].dataset = {};
                    }
                    tmp = jsPlayer.playlist[i].querySelector('a');
                    if (tmp.tagName && !jsPlayer.playlist[i].dataset.idx) {
                        jsPlayer.playlist[i].dataset.idx = i;
                        jsPlayer.trackCount++;
                        jsPlayer.tracks.push({
                            'file': tmp.href,
                            'artist': tmp.dataset.artist ? 'by ' + decodeURIComponent(tmp.dataset.artist).replace(/^\s+|\s+$/g, '') : '&nbsp;',
                            'name': decodeURIComponent(tmp.textContent || tmp.innerText).replace(/^\s+|\s+$/g, '')
                        });
                    }
                }
            }
        };
        jsPlayer.loadTrack = function jsPlayerLoadTrack(idx) {
            var len = jsPlayer.playlist ? jsPlayer.playlist.length : 0,
                i;
            for (i = 0; i < len; i++) {
                if (jsPlayer.playlist[i].classList) {
                    if (i == idx) {
                        jsPlayer.playlist[i].classList.add('sel');
                    } else {
                        jsPlayer.playlist[i].classList.remove('sel');
                    }
                }
            }
            jsPlayer.titleText.innerHTML = jsPlayer.tracks[idx].name;
            jsPlayer.artistText.innerHTML = jsPlayer.tracks[idx].artist;
            jsPlayer.player.src = jsPlayer.tracks[idx].file;
            jsPlayer.idx = idx;
        };
        jsPlayer.playTrack = function jsPlayerPlayTrack(idx) {
            jsPlayer.loadTrack(idx);
            jsPlayer.playClicked();
        };
        jsPlayer.listClicked = function jsPlayerListClicked(event) {
            clearInterval(jsPlayer.seekInterval);
            var parent = event.target.parentNode;
            if (parent.parentNode.tagName.toLowerCase() === 'ol') {
                event.preventDefault();
                jsPlayer.playTrack(parent.dataset.idx);
            }
        };
        jsPlayer.setDuration = function jsPlayerSetDuration() {
            jsPlayer.durationTime.innerHTML = jsPlayer.formatTime(jsPlayer.player.duration);
            jsPlayer.currentTime.innerHTML = jsPlayer.formatTime(jsPlayer.player.currentTime);
            jsPlayer.seekBar.value = jsPlayer.player.currentTime / jsPlayer.player.duration;
        };
        jsPlayer.updateSeek = function jsPlayerUpdateSeek() {
            if (jsPlayer.player.duration > -1) {
                jsPlayer.seekBar.value = 100 * (jsPlayer.player.currentTime || 0) / jsPlayer.player.duration;
                jsPlayer.currentTime.innerHTML = jsPlayer.formatTime(jsPlayer.player.currentTime || 0);
            }
        };
        jsPlayer.seekHeld = function jsPlayerSeekHeld() {
            jsPlayer.seekBar.parentNode.classList.add('sel');
            clearInterval(jsPlayer.seekInterval);
            jsPlayer.player.pause();
        };
        jsPlayer.seekReleased = function jsPlayerSeekReleased() {
            if (jsPlayer.player.duration > -1) {
                jsPlayer.player.currentTime = jsPlayer.seekBar.value * jsPlayer.player.duration / 100;
                jsPlayer.seekBar.parentNode.classList.remove('sel');
                if (jsPlayer.playing) {
                    jsPlayer.player.play();
                    jsPlayer.seekInterval = setInterval(jsPlayer.updateSeek, 500);
                } else {
                    jsPlayer.updateSeek();
                }
            }
        };
        jsPlayer.prevClicked = function jsPlayerPrevClicked(event) {
            event.preventDefault();
            if (jsPlayer.idx - 1 > -1) {
                jsPlayer.idx--;
                if (jsPlayer.playing) {
                    jsPlayer.playTrack(jsPlayer.idx);
                } else {
                    jsPlayer.loadTrack(jsPlayer.idx);
                }
            } else {
                jsPlayer.pauseClicked();
                jsPlayer.idx = 0;
                jsPlayer.loadTrack(jsPlayer.idx);
            }
        };
        jsPlayer.nextClicked = function jsPlayerNextClicked(event) {
            event.preventDefault();
            if (jsPlayer.idx + 1 < jsPlayer.trackCount) {
                jsPlayer.idx++;
                if (jsPlayer.playing) {
                    jsPlayer.playTrack(jsPlayer.idx);
                } else {
                    jsPlayer.loadTrack(jsPlayer.idx);
                }
            } else {
                jsPlayer.pauseClicked();
                jsPlayer.idx = 0;
                jsPlayer.loadTrack(jsPlayer.idx);
            }
        };
        jsPlayer.playlistButtonClicked = function jsPlayerPlaylistButtonClicked() {
            jsPlayer.wrap.classList.toggle('show-list');
            jsPlayer.playlistButton.style.backgroundImage = (jsPlayer.wrap.classList.contains('show-list') && jsPlayer.wrap.style.backgroundImage) ? jsPlayer.wrap.style.backgroundImage : '';
        };
        jsPlayer.formatTime = function jsPlayerFormatTime(val) {
            var h = 0, m = 0, s;
            val = (parseInt(val, 10) || 0);
            if (val > 60 * 60) {
                h = parseInt(val / (60 * 60), 10);
                val -= h * 60 * 60;
            }
            if (val > 60) {
                m = parseInt(val / 60, 10);
                val -= m * 60;
            }
            s = val;
            val = (h > 0) ? h + ':' : '';
            val += (m > 0) ? ((m < 10 && h > 0) ? '0' : '') + m + ':' : '0:';
            val += ((s < 10) ? '0' : '') + s;
            return val;
        };
        jsPlayer.init = function jsPlayerInit() {
            if (!!document.createElement('audio').canPlayType('audio/mpeg')) {
                if (jsPlayer.wrapList.tagName && jsPlayer.wrapList.querySelectorAll('ol > li').length > 0) {
                    jsPlayer.loadTracklist();
                } else if (jsPlayer.wrap.tagName && jsPlayer.wrap.dataset.url) {
                    jsPlayer.tracks = [{
                        'file': jsPlayer.wrap.dataset.url,
                        'artist': 'by-' + decodeURIComponent(jsPlayer.wrap.dataset.artist || 'unknown').replace(/^\s+|\s+$/g, ''),
                        'name': decodeURIComponent(jsPlayer.wrap.dataset.title || '').replace(/^\s+|\s+$/g, '')
                    }];
                }
                if (jsPlayer.tracks.length > 0 && jsPlayer.player) {
                    jsPlayer.player.addEventListener('ended', jsPlayer.mediaEnded, true);
                    jsPlayer.player.addEventListener('loadeddata', jsPlayer.setDuration, true);
                    if (jsPlayer.wrapList.tagName) {
                        jsPlayer.wrapList.addEventListener('click', jsPlayer.listClicked, true);
                    }
                    if (jsPlayer.bigPlayButton.tagName) {
                        jsPlayer.bigPlayButton.addEventListener('click', jsPlayer.playClicked, true);
                        if (jsPlayer.bigPauseButton.tagName) {
                            jsPlayer.bigPauseButton.addEventListener('click', jsPlayer.pauseClicked, true);
                        }
                    }
                    if (jsPlayer.playButton.tagName) {
                        jsPlayer.playButton.addEventListener('click', jsPlayer.playClicked, true);
                        if (jsPlayer.pauseButton.tagName) {
                            jsPlayer.pauseButton.addEventListener('click', jsPlayer.pauseClicked, true);
                        }
                    }
                    if (jsPlayer.prevButton.tagName) {
                        jsPlayer.prevButton.addEventListener('click', jsPlayer.prevClicked, true);
                    }
                    if (jsPlayer.nextButton.tagName) {
                        jsPlayer.nextButton.addEventListener('click', jsPlayer.nextClicked, true);
                    }
                    if (jsPlayer.playlistButton.tagName) {
                        jsPlayer.playlistButton.addEventListener('click', jsPlayer.playlistButtonClicked, true);
                    }
                    if (jsPlayer.seekBar.tagName) {
                        jsPlayer.seekBar.addEventListener('mousedown', jsPlayer.seekHeld, true);
                        jsPlayer.seekBar.addEventListener('mouseup', jsPlayer.seekReleased, true);
                    }
                    jsPlayer.wrap.className += ' enabled';
                    jsPlayer.loadTrack(jsPlayer.idx);
                }
            }
        };
        jsPlayer.init();
    }
</script>
</body>

</html>
