Java
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>

<form action="#" method="post">
    <p>Saisir la valeur 1 (A) : <input type="text" name="valeur1"></p>
    <p>Saisir la valeur 2 (B) : <input type="text" name="valeur2"></p>
    <p>Saisir la valeur 3 (C) : <input type="text" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des 3 valeurs --%>
<% 
    String valeur1 = request.getParameter("valeur1"); 
    String valeur2 = request.getParameter("valeur2"); 
    String valeur3 = request.getParameter("valeur3"); 
%>

<%-- On vérifie que TOUTES les valeurs existent et ne sont pas vides avant de faire les calculs --%>
<% if (valeur1 != null && !valeur1.isEmpty() && 
       valeur2 != null && !valeur2.isEmpty() && 
       valeur3 != null && !valeur3.isEmpty()) { 
       
    // Conversion en entiers
    int A = Integer.parseInt(valeur1); 
    int B = Integer.parseInt(valeur2); 
    int C = Integer.parseInt(valeur3); 
%>
       
    <hr/>
    <h3>Démonstration de base (Comparaison simple entre A et B) :</h3>
    <% if (A > B) { %>
        <p>A (<%= A %>) est supérieure à B (<%= B %>).</p>
    <% } else if (A < B) { %>
        <p>A (<%= A %>) est inférieure à B (<%= B %>).</p>
    <% } else { %>
        <p>A (<%= A %>) est égale à B (<%= B %>).</p>
    <% } %>
   
    
    <h2>Exercice 1 : Comparaison 1</h2>
    <p>Est-ce que C est compris entre A et B ?</p>
    <% 
    // On vérifie si C est supérieur à A ET inférieur à B (ou l'inverse au cas où l'utilisateur saisit B plus petit que A)
    if ((C >= A && C <= B) || (C >= B && C <= A)) { 
    %>
        <p><strong>Oui, C (<%= C %>) est compris entre A (<%= A %>) et B (<%= B %>).</strong></p>
    <% } else { %>
        <p><strong>Non, C (<%= C %>) n'est pas compris entre A (<%= A %>) et B (<%= B %>).</strong></p>
    <% } %>


    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <p>Vérification du nombre A (<%= A %>) :</p>
    <% 
    // L'opérateur modulo % donne le reste de la division par 2. Si le reste est 0, c'est pair.
    if (A % 2 == 0) { 
    %>
        <p>Le nombre A (<%= A %>) est <strong>Pair</strong>.</p>
    <% } else { %>
        <p>Le nombre A (<%= A %>) est <strong>Impair</strong>.</p>
    <% } %>

<% } %>

<br/><br/>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
