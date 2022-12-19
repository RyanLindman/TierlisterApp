<%--
  Created by IntelliJ IDEA.
  User: noxat
  Date: 2022-12-15
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="container">
        <div class="container-row">
            <div class="tier-s">
                S
            </div>
            <% for(int i = 0; i < movies.size(); i++) { %>
                <% if(Objects.equals(movies.get(i).getTier(), "S")) { %>
                    <div class="movie">
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
                <% if(Objects.equals(movies.get(i).getTier(), "A")) { %>
                    <div class="movie">
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
                <% if(Objects.equals(movies.get(i).getTier(), "B")) { %>
                    <div class="movie">
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
            <% if(Objects.equals(movies.get(i).getTier(), "C")) { %>
                <div class="movie">
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
                <% if(Objects.equals(movies.get(i).getTier(), "D")) { %>
                     <div class="movie">
                           <%= movies.get(i).getTitle() %>
                     </div>
                <% } %>
            <% } %>
        </div>
      </div>
    <form action="homepageReciever.jsp" method="GET">
        <div class="instruction">
            <p> Rank your favorite movie series in this tier list above! <strong style="color: lightcoral">Movie series only!</strong> example: "Harry Potter" or "Fast & Furious" </p>
        </div>
        <br>
        <div class="input">
            <input type="text"  name="Movieserie" placeholder="This will insert in list"/>
            <select name="tierType">
                <option value="s">S</option>
                <option value="a">A</option>
                <option value="b">B</option>
                <option value="c">C</option>
                <option value="d">Dumpster</option>
            </select>
        </div>
    </form>
</body>
</html>
