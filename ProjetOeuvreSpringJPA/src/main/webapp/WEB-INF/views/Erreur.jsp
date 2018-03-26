<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.setAttribute("title", "Gestion des erreurs");
%>
<%@include file="./header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function Chargement()
      {
          var obj = document.getElementById("id_erreur");
          if (obj.value!='')
             alert('Erreur signalée  : "'+obj.value+"'");
      }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des erreurs</title>
</head>
<body onLoad="Chargement();" >

    <div class="container">
    <input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
        <div class="jumbotron text-center">
            <h1>
                Une erreur est survenue
            </h1>
        </div>
     &nbsp;&nbsp;
      <p><a href="index.htm">Retour à la page principale</a></p>
    </div>
</body>
</html>