<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Boucles</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les boucles</h1>
<form action="#" method="post">
    <label for="inputValeur">Saisir le nombre d'étoiles : </label>
    <input type="text" id="inputValeur" name="valeur">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la valeur saisie par l'utilisateur --%>
<% String valeur = request.getParameter("valeur"); %>
    
<%-- Vérification de l'existence de la valeur --%>
<% if (valeur != null && !valeur.isEmpty()) { %>

<%-- Boucle for pour afficher une ligne d'étoiles --%>
    <%int cpt = Integer.parseInt(valeur); %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
       <%= "*" %>
    <% } %>
    </p>

<h2>Exercice 1 : Le carré d'étoiles</h2>
<p>Ecrire le code afin de produire un carré d'étoile</p>
<%-- On vérifie que la variable cpt existe bien avant de lancer les boucles --%>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <%-- Boucle externe : pour chaque ligne --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        
        <%-- Boucle interne : pour chaque étoile de la ligne --%>
        <% for (int j = 1; j <= cpt; j++) { %>
            <%= "*" %>
        <% } %>
        
        <%-- On passe à la ligne suivante après avoir affiché toutes les étoiles de la ligne --%>
        <br/>
        
    <% } %>
    </p>
<% } %>

<h2>Exercice 2 : Triangle rectangle gauche</h2>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <%-- Boucle externe : gère les lignes de 1 jusqu'à cpt --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        
        <%-- Boucle interne : s'arrête à 'i' pour afficher le bon nombre d'étoiles --%>
        <% for (int j = 1; j <= i; j++) { %>
            <%= "*" %>
        <% } %>
        
        <br/>
    <% } %>
    </p>
<% } %>

<h2>Exercice 3 : Triangle rectangle inversé</h2>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <%-- Boucle externe : commence au max (cpt) et descend jusqu'à 1 --%>
    <% for (int i = cpt; i >= 1; i--) { %>
        
        <%-- Boucle interne : affiche 'i' étoiles pour la ligne en cours --%>
        <% for (int j = 1; j <= i; j++) { %>
            <%= "*" %>
        <% } %>
        
        <br/>
    <% } %>
    </p>
<% } %>

<h2>Exercice 4 : Triangle rectangle 2</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
        
        <%-- 1. Boucle pour les espaces (décroissant) --%>
        <% for (int j = 1; j <= (cpt - i); j++) { %>
            <%= "&nbsp;&nbsp;" %>
        <% } %>
        
        <%-- 2. Boucle pour les étoiles (croissant) --%>
        <% for (int k = 1; k <= i; k++) { %>
            <%= "*" %>
        <% } %>
        
        <br/>
    <% } %>
    </p>
<% } %>

<h2>Exercice 5 : Triangle isocele</h2>
<p>Ecrire le code afin de produire un triangle rectangle aligné sur la droite</p>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <% for (int i = 1; i <= cpt; i++) { %>
        
        <%-- 1. Boucle pour les espaces (un seul &nbsp; ici) --%>
        <% for (int j = 1; j <= (cpt - i); j++) { %>
            <%= "&nbsp;" %>
        <% } %>
        
        <%-- 2. Boucle pour les étoiles --%>
        <% for (int k = 1; k <= i; k++) { %>
            <%= "*" %>
        <% } %>
        
        <br/>
    <% } %>
    </p>
<% } %>

<h2>Exercice 6 : Le demi losange</h2>
<p>Ecrire le code afin de produire un losange</p>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <%-- PARTIE 1 : Haute et croissante --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        <% for (int j = 1; j <= (cpt - i); j++) { %>
            <%= "&nbsp;&nbsp;" %>
        <% } %>
        <% for (int k = 1; k <= i; k++) { %>
            <%= "*" %>
        <% } %>
        <br/>
    <% } %>
    
    <%-- PARTIE 2 : Basse et décroissante (i commence au max et descend) --%>
    <% for (int i = cpt; i >= 1; i--) { %>
        <% for (int j = 1; j <= (cpt - i); j++) { %>
            <%= "&nbsp;&nbsp;" %>
        <% } %>
        <% for (int k = 1; k <= i; k++) { %>
            <%= "*" %>
        <% } %>
        <br/>
    <% } %>
    </p>
<% } %>

<h2>Exercice 7 : La table de multiplication</h2>
<p>Ecrire le code afin de créser une table de multiplication</p>
<% if (valeur != null && !valeur.isEmpty()) { %>
    <p>
    <%-- Une seule boucle qui compte de 1 jusqu'à cpt --%>
    <% for (int i = 1; i <= cpt; i++) { %>
        
        <%-- On affiche le texte fixe et le résultat du calcul dynamique --%>
        <%= cpt %> x <%= i %> = <%= cpt * i %>
        
        <br/>
    <% } %>
    </p>
<% } %>
<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
