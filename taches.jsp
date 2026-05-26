
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Task" %>

<%
request.setCharacterEncoding("UTF-8");

// Récupération session
ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");
if (taches == null) {
    taches = new ArrayList<Task>();
}

// ================== SUPPRESSION ==================
String indexToDelete = request.getParameter("delete");
if (indexToDelete != null) {
    int index = Integer.parseInt(indexToDelete);
    if (index >= 0 && index < taches.size()) {
        taches.remove(index);
    }
    session.setAttribute("taches", taches);
}

// ================== UPDATE STATUT ==================
String indexToUpdate = request.getParameter("update");
String newStatut = request.getParameter("newStatut");
String newCommentaire = request.getParameter("newCommentaire");

if (indexToUpdate != null && newStatut != null) {
    int index = Integer.parseInt(indexToUpdate);
    if (index >= 0 && index < taches.size()) {

        Task taskToUpdate = taches.get(index);
        taskToUpdate.setStatut(newStatut);

        if ("Problème".equals(newStatut)) {
            taskToUpdate.setCommentaire(newCommentaire != null ? newCommentaire : "");
        } else {
            taskToUpdate.setCommentaire("");
        }
    }
}

// ================== AJOUT ==================
String titre = request.getParameter("titre");
String description = request.getParameter("description");
String dateEcheance = request.getParameter("dateEcheance");
String statut = request.getParameter("statut");

if (titre != null && description != null && !titre.trim().isEmpty()) {

    String duree = "";

    if ("Gros oeuvre".equals(titre)) {
        duree = "14 semaines";
    } else if ("Second oeuvre".equals(titre)) {
        duree = "14 semaines";
    } else if ("Finitions".equals(titre)) {
        duree = "10 semaines";
    }

    Task t = new Task();
    t.setTitre(titre);
    t.setDescription(description);
    t.setDateEcheance(dateEcheance);
    t.setStatut(statut);
    t.setDureeEstimee(duree);
    t.setCommentaire("");

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
    font-family: Arial;
    margin: 20px;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 1px solid #999;
    padding: 10px;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f9f9f9;
}

.badge-attente { color: blue; font-weight: bold; }
.badge-encours { color: orange; font-weight: bold; }
.badge-probleme { color: red; font-weight: bold; }
.badge-termine { color: green; font-weight: bold; }
</style>

<script>
function toggleComment(select, index) {
    const champ = document.getElementById("comment-" + index);
    if (select.value === "Problème") {
        champ.style.display = "inline-block";
    } else {
        champ.style.display = "none";
        champ.value = "";
    }
}
</script>

</head>

<body>

<h2>📋 Liste des tâches</h2>

<hr>

<% if (taches.isEmpty()) { %>
<p>Aucune tâche pour le moment.</p>
<% } else { %>

<table>
<tr>
    <th>Phase</th>
    <th>Description</th>
    <th>Date</th>
    <th>Durée estimée</th>
    <th>Statut</th>
    <th>Commentaire</th>
    <th>Action</th>
</tr>

<%
int i = 0;
for (Task t : taches) {

String s = t.getStatut();
String commentaire = t.getCommentaire();
%>

<tr>
    <td><%= t.getTitre() %></td>
    <td><%= t.getDescription() %></td>
    <td><%= t.getDateEcheance() %></td>
    <td><%= t.getDureeEstimee() %></td>

    <!-- ✅ STATUT + MODIFICATION -->
    <td>

    <% if ("Terminé".equals(s)) { %>
        <span class="badge-termine">✅ Terminé</span>
    <% } else if ("Problème".equals(s)) { %>
        <span class="badge-probleme">⚠ Problème</span>
    <% } else if ("En cours".equals(s)) { %>
        <span class="badge-encours">⏳ En cours</span>
    <% } else { %>
        <span class="badge-attente">📌 En attente</span>
    <% } %>

    <br><br>

    <form action="taches.jsp" method="post">
        <input type="hidden" name="update" value="<%= i %>">

        <select name="newStatut" onchange="toggleComment(this,<%=i%>)">
            <option>En attente de traitement</option>
            <option>En cours</option>
            <option>Problème</option>
            <option>Terminé</option>
        </select>

        <br>

        <input type="text"
               name="newCommentaire"
               id="comment-<%=i%>"
               placeholder="Décrire le problème"
               value="<%= commentaire != null ? commentaire : "" %>"
               style="<%= "Problème".equals(s) ? "display:inline-block;" : "display:none;" %>">

        <br>
        <input type="submit" value="Modifier">
    </form>

    </td>

    <!-- ✅ AFFICHAGE COMMENTAIRE -->
    <td>
        <%= (commentaire != null && !commentaire.trim().isEmpty()) ? commentaire : "-" %>
    </td>

    <!-- ✅ SUPPRESSION -->
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
