<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<%
    session.setAttribute("title", "Gestion des erreurs");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
function Chargement()
      {
          var obj = document.getElementById("id_erreur");
          if (obj.value!='')
             alert('Erreur signalée  : "'+obj.value+"'");
      }
</script>
<%@include file="./header.jsp" %>
<body style="margin-bottom: 20px;" onLoad="Chargement();" >

    <div class="container">
    <input type ="hidden" name="uneErreur"  value="${MesErreurs}"  id ="id_erreur" >
        <div class="jumbotron text-center">
            <h1>${MesErreurs}
                Une erreur est survenue
            </h1>
        </div>
     &nbsp;&nbsp;
      <p><a href="index.htm">Retour à la page principale</a></p>
    </div>
</body>
<%@include file="./footer.jsp"%>
</html>