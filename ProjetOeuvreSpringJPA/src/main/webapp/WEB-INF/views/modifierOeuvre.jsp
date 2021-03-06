<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<%
    session.setAttribute("title", "Modifier oeuvres");
%>

<%@include file="./header.jsp" %>


<body style="margin-bottom: 20px;">
<div class="jumbotron text-center">
    <c:choose>
        <c:when test="${ not empty idOeuvrevente}">
            <h1>Modifier une oeuvre</h1>
        </c:when>
        <c:otherwise>
            <h1>Ajouter une oeuvre</h1>
        </c:otherwise>
    </c:choose>
</div>

<div class="container">
    <FORM  name='identification' method="post" action="insererOeuvre.htm" onsubmit="return teste()">
        <input hidden id="idOeuvrevente" name="idOeuvrevente" value="${idOeuvrevente}">

        <div class="form-group">
            <label for="titreOeuvrevente">Titre:</label>
            <input
                    type="text"
                    class="form-control"
                    id="titreOeuvrevente"
                    <c:if test="${not empty idOeuvrevente}">
                            value="${titreOeuvrevente}"
                    </c:if>
                    placeholder="${titreOeuvrevente}"
                    name="titreOeuvrevente"
                    required
            >
        </div>
        <div class="form-group">
            <label for="prixOeuvrevente">Prix :</label>
            <input required
                    type="number"
                    class="form-control"
                    id="prixOeuvrevente"
                    <c:if test="${not empty idOeuvrevente}">
                        value="${prixOeuvrevente}"
                    </c:if>
                    placeholder="${prixOeuvrevente}"
                    name="prixOeuvrevente"
            >
        </div>
        <div class="form-group">
            <label for="idProprietaire" >Proprietaire :</label>
            <select class="form-control" name="idProprietaire" id="idProprietaire" required>
                <c:forEach items="${proprietaires}" var="proprietaire">
                    <option
                        value="${proprietaire.key}"
                        <c:if test="${proprietaire.key eq idProprietaire}">
                            selected
                        </c:if>
                    >
                            ${proprietaire.value.nomProprietaire}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button type="submit"class="btn btn-default" align="right">
            <c:choose>
                <c:when test="${not empty idOeuvrevente}">
                    Modifier
                </c:when>
                <c:otherwise>
                    Ajouter
                </c:otherwise>
            </c:choose>
        </button>
    </FORM>
</DIV>
</body>
<%@include file="./footer.jsp"%>
</html>