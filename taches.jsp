
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Task" %>

<%
request.setCharacterEncoding("UTF-8");

// Récupérer la liste en session
ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");

if (taches == null) {
    taches = new ArrayList<Task>();
}

// ✅ SUPPRESSION
String indexToDelete = request.getParameter("delete");
if (indexToDelete != null) {
    int index = Integer.parseInt(indexToDelete);
    if (index >= 0 && index < taches.size()) {
        taches.remove(index);
    }
    session.setAttribute("taches", taches);
}

// ✅ MODIFICATION STATUT
String indexToUpdate = request.getParameter("update");
String newStatut = request.getParameter("newStatut");

if (indexToUpdate != null && newStatut != null) {
    int index = Integer.parseInt(indexToUpdate);
    if (index >= 0 && index < taches.size()) {
        taches.get(index).setStatut(newStatut);
    }
    session.setAttribute("taches", taches);
}

// ✅ RÉCUPÉRATION FORMULAIRE
String titre = request.getParameter("titre");
String description = request.getParameter("description");
String dateEcheance = request.getParameter("dateEcheance");
String statut = request.getParameter("statut");

// ✅ AJOUT TÂCHE
if (titre != null && description != null && !titre.isEmpty()) {

    Task t = new Task();
    t.setTitre(titre);
    t.setDescription(description);
    t.setDateEcheance(dateEcheance);
    t.setStatut(statut);

    taches.add(t);

    session.setAttribute("taches", taches);
}
%>

<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <title>Liste des tâches</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        table {
            border-collapse: collapse;
            width: 90%;
        }

        td, th {
            padding: 10px;
            border: 1px solid black;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f9f9f9;
        }
    </style>

</head>
<body>

<h2>📋 Liste des tâches</h2>

<hr>

<% if (taches.isEmpty()) { %>
    <p>Aucune tâche pour le moment.</p>
<% } else { %>

<table border="1">
    <tr>
        <th>Titre</th>
        <th>Description</th>
        <th>Date</th>
        <th>Statut</th>
        <th>Action</th>
    </tr>

<%
int i = 0;
for (Task t : taches) {
    String s = t.getStatut();
%>

<tr>
    <td><%= t.getTitre() %></td>
    <td><%= t.getDescription() %></td>
    <td><%= t.getDateEcheance() %></td>


<td>

<!-- ✅ STATUT COLORÉ -->
<%

if ("Terminé".equals(s)) {
%>
    <span style="color:green; font-weight:bold;">✅ Terminé</span>
<%
} else if ("Problème".equals(s)) {
%>
    <span style="color:red; font-weight:bold;">⚠ Problème</span>
<%
} else if ("En cours".equals(s)) {
%>
    <span style="color:orange; font-weight:bold;">⏳ En cours</span>
<%
} else if ("En attente de traitement".equals(s)) {
%>
    <span style="color:blue; font-weight:bold;">📌 En attente</span>
<%
} else {
%>
    <span style="color:gray;">📌 En attente</span>
<%
}
%>

<br>

<!-- ✅ MINI FORMULAIRE PLUS PROPRE -->
<form action="taches.jsp" method="post" style="margin-top:5px;">
    <input type="hidden" name="update" value="<%= i %>">

    <select name="newStatut" style="font-size:12px;">
        <option value="En attente de traitement">En attente</option>
        <option value="En cours">En cours</option>
        <option value="Problème">Problème</option>
        <option value="Terminé">Terminé</option>
    </select>

    <input type="submit" value="OK" style="font-size:12px;">
</form>

</td>


    <!-- ✅ MODIFIER STATUT -->
    <form action="taches.jsp" method="post">
        <input type="hidden" name="update" value="<%= i %>">

        <select name="newStatut">
            <option>En attente de traitement</option>
            <option>En cours</option>
            <option>Problème</option>
            <option>Terminé</option>
        </select>

        <input type="submit" value="Modifier">
    </form>

    </td>

    <!-- ✅ SUPPRIMER -->
    <td>
        <a href="taches.jsp?delete=<%= i %>">🗑️ Supprimer</a>
    </td>
</tr>

<%
    i++;
}
%>

</table>

<% } %>

<br><br>

<a href="addTask.jsp">➕ Ajouter une tâche</a><br><br>
<a href="index.jsp">⬅ Retour accueil</a>

</body>
</html>
