<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<%
    session.setAttribute("title", "Ajouter adhérents");
%>

<%@include file="./header.jsp"%>
<body style="margin-bottom: 20px;">
    <div class="jumbotron text-center">
        <h1>Ajout d'un adhérent</h1>
    </div>

    <div class="container">
        <FORM  name='identification' method="post" action="insererAdherent.htm" onsubmit="return teste()">
            <div class="form-group">
                <label for="nomAdherent">Nom de l'adherent :</label>
                <input type="text" class="form-control" id="nomAdherent" placeholder="" name="nomAdherent">
            </div>
            <div class="form-group">
                <label for="prenomAdherent">Prenom de l'adherent :</label>
                <input type="text" class="form-control" id="prenomAdherent" placeholder="" name="prenomAdherent">
            </div>
            <div class="form-group">
                <label for="villeAdherent">Ville de l'adherent :</label>
                <input type="text" class="form-control" id="villeAdherent" placeholder="" name="villeAdherent">
            </div>

            <button type="submit"class="btn btn-default">Ajouter</button>
        </FORM>
    </DIV>
</body>
<%@include file="./footer.jsp"%>
</html>