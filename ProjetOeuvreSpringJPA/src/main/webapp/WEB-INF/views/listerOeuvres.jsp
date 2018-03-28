<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<%
    session.setAttribute("title", "Liste des oeuvres");
%>

<%@include file="./header.jsp" %>

<body style="margin-bottom: 20px;">

<div class="jumbotron text-center">
    <h1>Listing des oeuvres</h1>
</div>

<div class="container">
    <a class="btn btn-secondary" href="index.htm" role="button"><span class="glyphicon glyphicon-chevron-left"></span> Retour accueil</a>
    <h2>Tableau des oeuvres</h2>

    <table class="table table-striped">
        <thead>
        <tr>
            <TH>Numéro</TH>
            <TH>Titre</TH>
            <TH>Prix</TH>
            <TH>Proprietaire</TH>
            <TH>Actions</TH>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${oeuvresvente}" var="item">
            <c:set var="idOeuvre">${item.idOeuvrevente}</c:set>
            <c:set var="oeuvresReservees">${oeuvresReservees}</c:set>
            <tr>
                <td>${item.idOeuvrevente}</td>
                <td>${item.titreOeuvrevente}</td>
                <td>${item.prixOeuvrevente}</td>
                <td>${proprietaires.get(item.idProprietaire).nomProprietaire} ${proprietaires.get(item.idProprietaire).prenomProprietaire}</td>
                <td>
                    <c:url var="urlModifierOeuvre" value="modifierOeuvre.htm">
                        <c:param name="idOeuvrevente" value="${idOeuvre}"/>
                    </c:url>
                    <c:url var="urlReserverOeuvre" value="reserverOeuvre.htm">
                        <c:param name="idOeuvrevente" value="${idOeuvre}"/>
                    </c:url>
                    <c:choose>
                        <c:when test="${fn:contains(oeuvresReservees, idOeuvre)}">
                            <a href="${urlModifierOeuvre}">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${urlModifierOeuvre}">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                            <a href="${urlReserverOeuvre}">
                                <span class="glyphicon glyphicon-check"></span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<%@include file="./footer.jsp"%>
</html>