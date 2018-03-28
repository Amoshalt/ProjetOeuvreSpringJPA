<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<%
    session.setAttribute("title", "Ajouter propriétaire");
%>

<%@include file="./header.jsp" %>

<body style="margin-bottom: 20px;">
<div class="jumbotron text-center">
    <h1>Ajout d'un propriétaire</h1>
</div>

<div class="container">
    <FORM  name='identification' method="post" action="insererProprietaire.htm" onsubmit="return teste()">
        <div class="form-group">
            <label for="nomProprietaire">Nom du propriétaire :</label>
            <input type="text" class="form-control" id="nomProprietaire" placeholder="" name="nomProprietaire">
        </div>
        <div class="form-group">
            <label for="prenomProprietaire">Prenom du propriétaire:</label>
            <input type="text" class="form-control" id="prenomProprietaire" placeholder="" name="prenomProprietaire">
        </div>

        <button type="submit"class="btn btn-default">Ajouter</button>
    </FORM>
</DIV>
</body>
<%@include file="./footer.jsp"%>
</html>