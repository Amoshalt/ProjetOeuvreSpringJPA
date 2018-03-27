<%--
  Created by IntelliJ IDEA.
  User: lomba
  Date: 26/03/2018
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    session.setAttribute("title", "Modifier oeuvres");
%>
<%@include file="./header.jsp" %>
<SCRIPT language="Javascript" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="js/foncControle.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="col-xs-8 col-xs-offset-2">
        <h2 class="center">
            Réserver une oeuvre
        </h2>
    </div>
</div>

<div class="row" style="text-align: left">
    <form name='reservation' method="post" action="reserverOeuvre.htm">
        <!-- Champ caché -->
        <input type="hidden" name="idOeuvre" value="${oeuvre.idOeuvrevente}">

        <!-- Champs désactivés -->


        <div class="row">
            <div class="col-xs-4">
                <label for="titre">
                    Titre de l'œuvre :
                </label>
            </div>
            <div class="col-xs-8">
                <input class="form-control" name="titre" id="titre" value="${oeuvre.titreOeuvrevente}" readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-4">
                <label for="prix">
                    Prix :
                </label>
            </div>
            <div class="col-xs-8">
                <input class="form-control" name="prix" id="prix" value="${oeuvre.prixOeuvrevente}" readonly>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-4">
                <label for="date">
                    Date Réservation :
                </label>
            </div>
            <div class="col-xs-8">
                <input class="form-control" type="date" name="date" id="date" required>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-4">
                <label for="adherent">
                    Adhérent :
                </label>
            </div>
            <div class="col-xs-8">
                <select class="form-control" name="idAdherent" id="adherent" required>
                    <c:forEach items="${mesAdherents}" var="adherent">
                        <option value="${adherent.idAdherent}">${adherent.prenomAdherent} ${adherent.nomAdherent}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <br/>

        <div class="row">
            <div class="col-xs-4 col-xs-offset-1">
                <!-- Boutons Ajouter -->
                <input class="btn btn-primary" type="submit" name="bt" value="Réserver"/>
            </div>
            <div class="col-xs-4 col-xs-offset-2">
                <a class="btn btn-light btn-lg" href="listerOeuvre.htm">Annuler</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
