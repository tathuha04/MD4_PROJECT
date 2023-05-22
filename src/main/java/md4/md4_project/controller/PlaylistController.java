package md4.md4_project.controller;

import md4.md4_project.model.*;
import md4.md4_project.service.playlist.IPlaylistService;
import md4.md4_project.service.playlist.PlaylistServiceIMPL;
import md4.md4_project.service.song.ISongService;
import md4.md4_project.service.song.SongServiceIMPL;
import md4.md4_project.service.user.IUserService;
import md4.md4_project.service.user.UserServiceIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet(value = "/playlist")
public class PlaylistController extends HttpServlet {
    IPlaylistService playlistService = new PlaylistServiceIMPL();
    ISongService songService = new SongServiceIMPL();
    IUserService userService = new UserServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreatePlaylist(request, response);
                break;
            case "showAllPlaylist":
                showAllPlaylist(request, response);
                break;
            case "detailPlaylist":
                detailPlaylist(request, response);
                break;
            case "editPlaylist":
                showFormEditPlaylist(request, response);
                break;
            case "deletePlaylist":
                deletePlaylist(request, response);
                break;
            case "back":
                backToAdmin(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                actionCreatePlaylist(request, response);
                break;
            case "addSong":
                actionAddSongToPlaylist(request, response);
                break;
            case "removeSong":
                actionRemoveSongToPlaylist(request, response);
                break;


        }
    }

    private void showFormCreatePlaylist(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/playlist/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAllPlaylist(HttpServletRequest request, HttpServletResponse response) {
        List<Playlist> playlists = new ArrayList<>();
        playlists = playlistService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/playlist/list_playlist.jsp");
        request.setAttribute("playlists", playlists);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAllPlaylistOfUser(HttpServletRequest request, HttpServletResponse response) {
        List<Playlist> playlists = new ArrayList<>();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        playlists = playlistService.findAllPlaylistByUserId(userId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/playlist/list_playlist.jsp");
        request.setAttribute("playlists", playlists);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void detailPlaylist(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Song> songOfPlaylist = songService.findAllSongOfPlaylistByPlaylistId(id);
        List<Song> songs = songService.findAll();
        Playlist playlist = playlistService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/playlist/detail_playlist.jsp");
        request.setAttribute("playlist", playlist);
        request.setAttribute("songOfPlaylist", songOfPlaylist);
        request.setAttribute("song", songs);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreatePlaylist(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        Playlist playlist = new Playlist(name, avatar, userId);
        playlistService.save(playlist);
        showAllPlaylistOfUser(request, response);
    }

    private void showFormEditPlaylist(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/playlist/edit_playlist.jsp");
        request.setAttribute("songOfPlaylist", songService.findAllSongOfPlaylistByPlaylistId(id));
        request.setAttribute("song", songService.findAll());
        request.setAttribute("playlist", playlistService.findById(id));
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionAddSongToPlaylist(HttpServletRequest request, HttpServletResponse response) {
        int playlistId = Integer.parseInt(request.getParameter("id"));

        String[] songIdStr = request.getParameterValues("addSong");
        if (songIdStr != null) {
            int[] songIds = new int[songIdStr.length];
            for (int i = 0; i < songIdStr.length; i++) {
                songIds[i] = Integer.parseInt(songIdStr[i]);
            }
            List<Integer> listSongId = new ArrayList<>();
            for (int i = 0; i < songIds.length; i++) {
                listSongId.add(Integer.valueOf(songIds[i]));
            }

            playlistService.addSongToPlaylist(playlistId, listSongId);
        }
        detailPlaylist(request, response);

    }

    private void actionRemoveSongToPlaylist(HttpServletRequest request, HttpServletResponse response) {
        int playlistId = Integer.parseInt(request.getParameter("id"));
        System.out.println("idPL-->" + playlistId);
        String[] songIdStr = request.getParameterValues("removeSong");
        if (songIdStr != null) {
            int[] songIds = new int[songIdStr.length];
            for (int i = 0; i < songIdStr.length; i++) {
                songIds[i] = Integer.parseInt(songIdStr[i]);
            }
            List<Integer> listSongId = new ArrayList<>();
            for (int i = 0; i < songIds.length; i++) {
                listSongId.add(Integer.valueOf(songIds[i]));
            }
            System.out.println("remove-->" + listSongId);
            playlistService.removeSongToPlaylist(playlistId, listSongId);
        }
        detailPlaylist(request, response);

    }

    private void deletePlaylist(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        playlistService.deleteById(id);
        showAllPlaylistOfUser(request, response);
    }

    private void backToAdmin(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        RequestDispatcher dispatcher;
        if (user != null) {
            Set<Role> roleSet = userService.findRoleByUserId(user.getId());
            System.out.println(userService.findRoleByUserId(user.getId()));
            String roleName = String.valueOf(UserRole.USER);
            for (Role role : roleSet) {
                if (role.getId() == 3) {
                    System.out.println("3");
                    roleName = String.valueOf(UserRole.ADMIN);
                } else if ((role.getId() == 2) && (roleName == String.valueOf(UserRole.USER))) {
                    System.out.println("2");
                    roleName = String.valueOf(UserRole.PM);
                }
            }
            session.setAttribute("role", roleName);
            if (roleName.equals("USER")) {
                dispatcher = request.getRequestDispatcher("index.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("/WEB-INF/admin/admin2.jsp");
            }
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            dispatcher = request.getRequestDispatcher("index.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

