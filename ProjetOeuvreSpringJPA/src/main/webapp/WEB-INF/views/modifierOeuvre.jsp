<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1>Modifier une oeuvre</h1>
</div>

<div class="container">
    <FORM  name='identification' method="post" action="insererOeuvre.htm" onsubmit="return teste()">
        <div class="form-group">
            Id de l'oeuvre : ${idOeuvrevente}
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
            <label for="idProprietaire" >Proprietaire :</label>
            <select class="form-control" name="idProprietaire" id="idProprietaire">
                <c:forEach items="${proprietaires}" var="proprietaire">
                    <option
                        value="${proprietaire.key}"
                        <c:if test="${proprietaire.key} = ${idProprietaire} ">
                            selected
                        </c:if>
                    >
                            ${proprietaire.value.nomProprietaire}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button type="submit"class="btn btn-default">Ajouter</button>
    </FORM>
</DIV>
</body>
</html>