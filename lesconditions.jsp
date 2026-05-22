<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>
<%-- Exercice 1 --%>
<% if (valeur1 != null && valeur2 != null && !valeur1.isEmpty() && !valeur2.isEmpty()) { %>
    <% 
        int A = Integer.parseInt(valeur1);
        int B = Integer.parseInt(valeur2);
        int C = 15; // On fixe C à 15 comme dans l'exemple de l'énoncé
    %>
    <p><strong>Test avec C = <%= C %> :</strong></p>
    <% if ((C >= A && C <= B) || (C >= B && C <= A)) { %>
        <p>Oui, C (<%= C %>) est compris entre A (<%= A %>) et B (<%= B %>)</p>
    <% } else { %>
        <p>Non, C (<%= C %>) n'est pas compris entre A (<%= A %>) et B (<%= B %>)</p>
    <% } %>
<% } %>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>
<%-- Exercice 2 --%>
<% if (valeur1 != null && !valeur1.isEmpty()) { %>
    <% int nombre = Integer.parseInt(valeur1); %>
    
    <% if (nombre % 2 == 0) { %>
        <p>Le nombre Valeur 1 (<%= nombre %>) est <strong>Pair</strong>.</p>
    <% } else { %>
        <p>Le nombre Valeur 1 (<%= nombre %>) est <strong>Impair</strong>.</p>
    <% } %>
<% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
