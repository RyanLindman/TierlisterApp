<%@ page import="com.jensen.springexam1.MovieEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: noxat
  Date: 2022-12-15
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<MovieEntity> movies = (List<MovieEntity>) request.getAttribute("movies");
%>
<html>
<head>
    <title>TIERLISTER</title>
    <link rel="stylesheet" href="/style.css" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
</head>
<body>
    <div id="container">
        <div class="container-row">
            <div class="tier-s">
                S
            </div>
            <% for(int i = 0; i < movies.size(); i++) { %>
                <% if(Objects.equals(movies.get(i).getTier().toUpperCase(), "S")) { %>
                    <div class="movie" onclick="modal(this)">
                        <input type="hidden" value="<%= movies.get(i).getTier() %>" />
                        <input type="hidden" value="<%= movies.get(i).getId() %>" />
                        <%= movies.get(i).getTitle() %>
                    </div>
                <% } %>
            <% } %>
        </div>
        <div class="container-row">
            <div class="tier-a">
                A
            </div>
            <% for(int i = 0; i < movies.size(); i++) { %>
                <% if(Objects.equals(movies.get(i).getTier().toUpperCase(), "A")) { %>
                    <div class="movie" onclick="modal(this)">
                        <input type="hidden" value="<%= movies.get(i).getTier() %>" />
                        <input type="hidden" value="<%= movies.get(i).getId() %>" />
                        <%= movies.get(i).getTitle() %>
                    </div>
                <% } %>
            <% } %>
        </div>
        <div class="container-row">
            <div class="tier-b">
                B
            </div>
            <% for(int i = 0; i < movies.size(); i++) { %>
                <% if(Objects.equals(movies.get(i).getTier().toUpperCase(), "B")) { %>
                    <div class="movie" onclick="modal(this)">
                        <input type="hidden" value="<%= movies.get(i).getTier() %>" />
                        <input type="hidden" value="<%= movies.get(i).getId() %>" />
                        <%= movies.get(i).getTitle() %>
                    </div>
                <% } %>
            <% } %>

        </div>
        <div class="container-row">
            <div class="tier-c">
                C
            </div>
            <% for(int i = 0; i < movies.size(); i++) { %>
            <% if(Objects.equals(movies.get(i).getTier().toUpperCase(), "C")) { %>
                <div class="movie" onclick="modal(this)">
                    <input type="hidden" value="<%= movies.get(i).getTier() %>" />
                    <input type="hidden" value="<%= movies.get(i).getId() %>" />
                    <%= movies.get(i).getTitle() %>
                </div>
                <% } %>
            <% } %>

        </div>
        <div class="container-row">
            <div class="tier-d">
                D
            </div>
            <% for(int i = 0; i < movies.size(); i++) { %>
                <% if(Objects.equals(movies.get(i).getTier().toUpperCase(), "D")) { %>
                     <div class="movie" onclick="modal(this)">
                         <input type="hidden" value="<%= movies.get(i).getTier() %>" />
                         <input type="hidden" value="<%= movies.get(i).getId() %>" />
                           <%= movies.get(i).getTitle() %>
                     </div>
                <% } %>
            <% } %>
        </div>
      </div>

        <div class="instruction">
            <p> Rank your favorite movie series in this tier list above! <strong style="color: lightcoral">Movie series only!</strong> example: "Harry Potter" or "Fast & Furious" </p>
            <p> The series should contain of 3 or more movies for it to be considered as a movie series'  </p>
            <p> Print screen and share with friends! </p>
        </div>
        <div class="input">
            <input type="text"  name="Movieserie" placeholder="This will insert in list"/>
            <select name="tierType">
                <option style="background-color:#ff5173" value="s">S</option>
                <option style="background-color:lightsalmon" value="a">A</option>
                <option style="background-color:#ffc335" value="b">B</option>
                <option style="background-color:yellowgreen" value="c">C</option>
                <option style="background-color:#1dff21" value="d">Dumpster</option>
            </select>
            <button class="btn" id="saveMovieButton">
                <i class="fa fa-plus"></i>
            </button>
        </div>

    <div id="editMovie" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <input type="hidden" id="editMovieId" value="" />
            <input type="text" id="editMovieTitle" value="" />
            <select id="editMovieTier">
                <option style="background-color: #ff5173" value="s">S</option>
                <option style="background-color:lightsalmon" value="a">A</option>
                <option style="background-color:#ffc335" value="b">B</option>
                <option style="background-color:yellowgreen" value="c">C</option>
                <option style="background-color:#1dff21" value="d">Dumpster</option>
            </select>
            <button onclick="updateMovie(this)">Update</button>
            <button id="deleteButton">Delete</button>
        </div>
    </div>

    <script>
        const modal = (e) => {
            const movie = e.textContent.trim()
            const movieTier = e.getElementsByTagName('input').item(0).value;
            const id = e.getElementsByTagName('input').item(1).value;

            const modal = document.getElementById('editMovie');
            const span = document.getElementsByClassName('close').item(0);
            let deleteButton = document.getElementById('deleteButton');

            // Set default values
            let editMovieTitleInput = document.getElementById('editMovieTitle');
            let editMovieTierSelect = document.getElementById('editMovieTier');
            document.getElementById('editMovieId').value = id;
            editMovieTitleInput.value = movie;
            // Search for selected tier and set as default
            for (let i, j = 0; i = editMovieTierSelect.options[j]; j++) {
                if (i.value == movieTier.toLowerCase()) {
                    editMovieTierSelect.selectedIndex = j;
                }
            }

            modal.style.display = "block";
            span.onclick = () => {
                modal.style.display = "none";
            }

            // Setup buttons
            deleteButton.onclick = () => {
                deleteMovie(id, movie, movieTier);
            }

            window.onclick = (e) => {
                if (e.target == modal) {
                    modal.style.display = "none";
                }
            }
        }

        const updateMovie = (e) => {
            const id = document.getElementById('editMovieId').value;
            const movieName = document.getElementById('editMovieTitle').value;
            const tier = document.getElementById('editMovieTier').value;

            const url = 'http://localhost:8080/movies/update';
            const http = new XMLHttpRequest();
            const payload = {
                id: id,
                title: movieName,
                tier: tier,
            };
            http.open('PUT', url);
            http.setRequestHeader('Content-Type', 'application/json');
            http.send(JSON.stringify(payload));

            http.onreadystatechange = (e) => {
                console.log(http.responseText);
                location.reload();
            }
        }

        const deleteMovie = (id, title, tier) => {
            const url = 'http://localhost:8080/movies/delete';
            const http = new XMLHttpRequest();
            const payload = {
                id: id,
                title: title,
                tier: tier,
            };
            http.open('DELETE', url);
            http.setRequestHeader('Content-Type', 'application/json');
            http.send(JSON.stringify(payload));

            http.onreadystatechange = (e) => {
                console.log(http.responseText);
                location.reload();
            }
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            const rows = document.getElementsByClassName('container-row');
            for (let i = 0; i < rows.length; i++) {
                const row = rows.item(i);
                const tierElement = row.getElementsByTagName('div').item(0);
                const tierColor = window.getComputedStyle(tierElement).backgroundColor;
                row.style.borderBottom = "1px solid " + tierColor;
            }
        });

        document.getElementById('saveMovieButton').addEventListener('click', function() {
            const http = new XMLHttpRequest();
            const url = "http://localhost:8080/movies/create";
            let movieName = document.getElementsByName('Movieserie').item(0).value;
            let tier = document.getElementsByName('tierType').item(0).value;
            const payload = {
                title: movieName,
                tier: tier.toUpperCase(),
            };

            http.open('POST', url);
            http.setRequestHeader('Content-Type', 'application/json');
            http.send(JSON.stringify(payload));

            http.onreadystatechange = (e) => {
                console.log(http.responseText);
                location.reload();
            }
        });
    </script>
</body>
</html>
