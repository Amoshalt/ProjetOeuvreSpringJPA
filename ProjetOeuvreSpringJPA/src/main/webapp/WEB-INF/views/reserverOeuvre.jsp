<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    session.setAttribute("title", "Réserver une oeuvre");
%>
<%@include file="./header.jsp" %>
<html>
<body>
<div class="jumbotron text-center">
    <h1>Réserver une oeuvre</h1>
</div>

<div class="container">
    <form name='confirmerReservation' method="post" action="confirmerReservation.htm">
        <input type="hidden" name="idOeuvrevente" id="idOeuvrevente" value="${oeuvre.idOeuvrevente}">

        <div class="form-group">
            <label for="titreOeuvrevente">
                Titre de l'œuvre :
            </label>
            <input class="form-control" name="titreOeuvrevente" id="titreOeuvrevente" value="${oeuvre.titreOeuvrevente}" readonly>
        </div>

        <div class="form-group">
            <label for="prixOeuvrevente">
                Prix :
            </label>
            <input class="form-control" name="prixOeuvrevente" id="prixOeuvrevente" value="${oeuvre.prixOeuvrevente}" readonly>
        </div>

        <div class="form-group">
            <label for="date">
                Date réservation :
            </label>
            <input class="form-control" type="date" name="date" id="date" required>
        </div>

        <div class="form-group">
            <label for="idAdherent">
                Adhérent :
            </label>
            <select class="form-control" name="idAdherent" id="idAdherent" required>
                <c:forEach items="${adherents}" var="adherent">
                    <option value="${adherent.idAdherent}">${adherent.prenomAdherent} ${adherent.nomAdherent}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <input class="btn btn-primary" type="submit" name="bt" value="Réserver" style="float: left"/>
            <a class="btn btn-light" href="listerOeuvres.htm" style="float: right">Annuler</a>
        </div>

    </form>
</div>
</body>
</html>
