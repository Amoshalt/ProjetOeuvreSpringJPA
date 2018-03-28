<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<%
	session.setAttribute("title", "Accueil");
%>

<%@include file="./header.jsp" %>

<body style="margin-bottom: 20px;">
<div class="jumbotron text-center">
	<h1>Bienvenue sur la médiathèque de Polytech</h1>
</div>

<div class="container">
	<h2>Sélectionnez la fonctionnalité voulue:</h2>
	<div class="row" >
		<a href="ajouterAdherent.htm">
			<button type="button" class="btn btn-default col-sm-4" style="margin-left: 1%; width : 30%; margin-top: 10px;">
				<span class="glyphicon glyphicon-plus"></span>  Ajout adhérent
			</button>
		</a>
		<a href="listerAdherent.htm">
			<button type="button" class="btn btn-default col-sm-4" style="margin-left: 1%; width : 30%; margin-top: 10px;">
				<span class="glyphicon glyphicon-th-list"></span>  Lister les adhérents
			</button>
		</a>
		<a href="javascript:fermer()">
			<button type="button" class="btn btn-default col-sm-4" style="margin-left: 1%; width : 30%; margin-top: 10px;">
				<span class="glyphicon glyphicon-log-out"></span>  Quitter
			</button>
		</a>
	</div>
</div>
</body>
<%@include file="./footer.jsp"%>
</html>