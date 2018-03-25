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
    <title>Ajouter un  adhérent</title>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Médiathèque de POLYTECH</a>
            </div>
            <p class="navbar-text">Gestion de l'exposition 2016</p>
            <ul class="nav navbar-nav">
                <li><a href="index.htm"> <span class="glyphicon glyphicon-home"></span> Accueil</a></li>
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
<SCRIPT language="Javascript" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="js/foncControle.js"></script>


<body>
<div class="jumbotron text-center">
    <h1>Ajout d'un Propriétaire</h1>
</div>

<div class="container">
    <FORM  name='identification' method="post" action="insererProprietaire.htm" onsubmit="return teste()">
        <div class="form-group">
            <label for="numero">Numero :</label>
            OeuvreventeId :${idOeuvrevente}fin
            <input type="number" class="form-control" id="numero" placeholder="${idOeuvrevente}" name="numero">
        </div>
        <div class="form-group">
            <label for="titreOeuvre">Titre:</label>
            <input type="text" class="form-control" id="titreOeuvre" placeholder="${titreOeuvrevente}" name="titreOeuvre">
        </div>
        <div class="form-group">
            <label for="prix">Prix :</label>
            <input type="text" class="form-control" id="prix" placeholder="${prixOeuvrevente}" name="prix">
        </div>
        <div class="form-group">
            <label for="proprietaire">Proprietaire :</label>
            <input type="text" class="form-control" id="proprietaire" placeholder="${proprietaire.nomProprietaire} ${proprietaire.prenomProprietaire} " name="prix">
        </div>

        <button type="submit"class="btn btn-default">Ajouter</button>
    </FORM>
</DIV>
</body>
</html>