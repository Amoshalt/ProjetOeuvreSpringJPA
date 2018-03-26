<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    session.setAttribute("title", "Modifier oeuvres");
%>
<%@include file="./header.jsp" %>
<SCRIPT language="Javascript" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="js/foncControle.js"></script>


<body>
<div class="jumbotron text-center">
    <h1>Ajout d'un Propriétaire</h1>
</div>

<div class="container">
    <FORM  name='identification' method="post" action="insererOeuvre.htm" onsubmit="return teste()">
        <div class="form-group">
            <label for="idOeuvrevente">Numero :</label>
            OeuvreventeId :${idOeuvrevente}fin
            <input type="number" class="form-control" id="idOeuvrevente" placeholder="${idOeuvrevente}" name="numero">
        </div>
        <div class="form-group">
            <label for="titreOeuvrevente">Titre:</label>
            <input type="text" class="form-control" id="titreOeuvrevente" placeholder="${titreOeuvrevente}" name="titreOeuvre">
        </div>
        <div class="form-group">
            <label for="prixOeuvrevente">Prix :</label>
            <input type="number" class="form-control" id="prixOeuvrevente" placeholder="${prixOeuvrevente}" name="prix">
        </div>
        <div class="form-group">
            <label for="nomProprietaire">Proprietaire :</label>
            <input type="text" class="form-control" id="nomProprietaire" placeholder="${proprietaire.nomProprietaire} ${proprietaire.prenomProprietaire} " name="prix">
        </div>

        <button type="submit"class="btn btn-default">Ajouter</button>
    </FORM>
</DIV>
</body>
</html>