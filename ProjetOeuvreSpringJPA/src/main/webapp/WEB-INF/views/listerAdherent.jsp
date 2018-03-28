<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<%
	session.setAttribute("title", "Liste des adhérents");
%>

<%@include file="./header.jsp" %>

<body style="margin-bottom: 20px;">

	<div class="jumbotron text-center">
		<h1>Listing des adhérents</h1>
	</div>

	<div class="container">
		<a class="btn btn-secondary" href="index.htm" role="button"><span class="glyphicon glyphicon-menu-left"></span> Retour accueil</a>
		<h2>Tableau des Adhérents</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<TH>Numero</TH>
					<TH>Nom</TH>
					<TH>Prénom</TH>
					<TH>Ville</TH>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mesAdherents}" var="item">
					<tr>
						<td>${item.idAdherent}</td>
						<td>${item.nomAdherent}</td>
						<td>${item.prenomAdherent}</td>
						<td>${item.villeAdherent}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<%@include file="./footer.jsp"%>
</html>