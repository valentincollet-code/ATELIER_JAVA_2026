<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de charactères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- Extraction du 3° caractère dans votre chaine --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaine est la lettre <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous chaine de votre texte : <%= sousChaine %></p>

    <%-- Recharche de la lettre "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en : <%= position %></p>

    
<h2>Exercice 1 : Combien de 'e' dans notre chaine de charactère ?</h2>
<p>Ecrire un programme pour compter le nombre de lettre e dans votre chaine de charactères</p>
<% 
    int compteurE = 0;
    for (int i = 0; i < chaine.length(); i++) {
        // On vérifie les minuscules et les majuscules
        if (chaine.charAt(i) == 'e' || chaine.charAt(i) == 'E') {
            compteurE++;
        }
    }
%>
<p>Il y a <strong><%= compteurE %></strong> lettre(s) 'e' dans votre texte.</p>

<h2>Exercice 2 : Affichage verticale</h2>
<p>Ecrire le programme pour afficher le texte en vertical</br>
<p>
<% 
    for (int i = 0; i < chaine.length(); i++) { 
%>
    <%= chaine.charAt(i) %><br/>
<% 
    } 
%>
</p>

<h2>Exercice 3 : Retour à la ligne</h2>
<p>La présence d'un espace provoque un retour à la ligne </br>
<p>
    <%-- On remplace les espaces par des sauts de ligne HTML --%>
    <%= chaine.replace(" ", "<br/>") %>
</p>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<p>
<% 
    for (int i = 0; i < chaine.length(); i += 2) { 
%>
    <%= chaine.charAt(i) %>
<% 
    } 
%>
</p>

<h2>Exercice 5 : La phrase en verlant</h2>
<p>
<% 
    for (int i = chaine.length() - 1; i >= 0; i--) { 
%>
    <%= chaine.charAt(i) %>
<% 
    } 
%>
</p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<% 
    int nbVoyelles = 0;
    int nbConsonnes = 0;
    // On passe tout en minuscules pour ne pas avoir à gérer les majuscules
    String texteMin = chaine.toLowerCase(); 

    for (int i = 0; i < texteMin.length(); i++) {
        char c = texteMin.charAt(i);
        
        // On s'assure que c'est bien une lettre de l'alphabet
        if (c >= 'a' && c <= 'z') {
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y') {
                nbVoyelles++;
            } else {
                nbConsonnes++;
            }
        }
    }
%>
<p>Dans votre texte, il y a :</p>
<ul>
    <li><strong><%= nbVoyelles %></strong> voyelle(s)</li>
    <li><strong><%= nbConsonnes %></strong> consonne(s)</li>
</ul>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
