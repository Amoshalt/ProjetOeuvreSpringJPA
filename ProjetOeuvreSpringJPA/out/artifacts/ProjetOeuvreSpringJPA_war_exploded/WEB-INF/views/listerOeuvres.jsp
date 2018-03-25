<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Affichage de tous les adhérents</title>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Médiathèque de POLYTECH</a>
            </div>
            <p class="navbar-text">Gestion de l'exposition 2016</p>
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.htm"> <span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                        Adhérents
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="ajouterAdherent.htm"> <span class="glyphicon glyphicon-plus"></span> Ajout Adhérent</a></li>
                        <li><a href="listerAdherent.htm"><span class="glyphicon glyphicon-th-list"></span> Lister les adhérents</a></li>
                    </ul>
                </li><li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Oeuvres
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="ajouterProprietaire.htm"> <span class="glyphicon glyphicon-plus"></span> Ajout d'un propriétaire</a></li>
                    <li><a href="ajouterOeuvre.htm"> <span class="glyphicon glyphicon-plus"></span> Ajout d'une oeuvre</a></li>
                    <li><a href="listerOeuvres.htm"><span class="glyphicon glyphicon-th-list"></span> Lister les oeuvres</a></li>
                </ul>
            </li>
                <li><a href="javascript:fermer()"><span class="glyphicon glyphicon-log-out"></span> Quitter</a></li>
            </ul>
        </div>
    </nav>

</head>

<body>

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
        <c:forEach items="${mesOeuvres}" var="item">
            <c:set var="idOeuvre">${item.idOeuvrevente}</c:set>
            <c:set var="oeuvresReservees">${oeuvresReservees}</c:set>
            <tr>
                <td>${item.idOeuvrevente}</td>
                <td>${item.titreOeuvrevente}</td>
                <td>${item.prixOeuvrevente}</td>
                <td>${item.proprietaire.nomProprietaire} ${item.proprietaire.prenomProprietaire}</td>
                <td>
                    <c:choose>
                        <c:when test="${fn:contains(oeuvresReservees, idOeuvre)}">
                            <a href="modifierOeuvre.htm">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="modifierOeuvre.htm?idOeuvre=${idOeuvre}">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                            <a href="#">
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
</html>