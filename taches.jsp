<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Task" %>
<%
    ArrayList<Task> taches = (ArrayList<Task>) request.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<Task>();
    }

    Integer total = (Integer) request.getAttribute("total");
    Integer attente = (Integer) request.getAttribute("attente");
    Integer encours = (Integer) request.getAttribute("encours");
    Integer probleme = (Integer) request.getAttribute("probleme");
    Integer termine = (Integer) request.getAttribute("termine");

    if (total == null) total = 0;
    if (attente == null) attente = 0;
    if (encours == null) encours = 0;
    if (probleme == null) probleme = 0;
    if (termine == null) termine = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des tâches</title>
    <link rel="stylesheet" href="style.css">

    <script>
        function toggleComment(select, id) {
            const champ = document.getElementById("comment-" + id);
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

<div class="page">

    <header class="site-header">
        <div class="logo-wrap">
            <div class="logo-icon">📋</div>

            <div class="logo-block">
                <div class="logo-kicker">Pilotage du projet</div>
                <h1 class="logo-title">Suivi <span>Chantier</span></h1>
                <div class="logo-line"></div>
                <p class="logo-subtitle">
                    Tableau de suivi des phases de construction, des délais et des points bloquants du chantier.
                </p>
            </div>
        </div>
    </header>

    <div class="stats">
        <div class="stat-card">
            <div class="label">Total des tâches</div>
            <div class="value"><%= total %></div>
        </div>

        <div class="stat-card">
            <div class="label">En attente</div>
            <div class="value"><%= attente %></div>
        </div>

        <div class="stat-card">
            <div class="label">En cours</div>
            <div class="value"><%= encours %></div>
        </div>

        <div class="stat-card">
            <div class="label">Problèmes</div>
            <div class="value"><%= probleme %></div>
        </div>

        <div class="stat-card">
            <div class="label">Terminées</div>
            <div class="value"><%= termine %></div>
        </div>
    </div>

    <div class="card table-card">
        <h3 class="section-title">Tableau de gestion des tâches</h3>
        <p class="page-subtitle">
            Modifie les statuts, ajoute un commentaire en cas de problème et supprime les tâches terminées ou obsolètes.
        </p>

        <% if (taches.isEmpty()) { %>
            <p class="muted">Aucune tâche pour le moment.</p>
        <% } else { %>

        <table>
            <thead>
                <tr>
                    <th>Phase</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Durée estimée</th>
                    <th>Statut</th>
                    <th>Commentaire</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

            <% for (Task t : taches) {
                String s = t.getStatut();
                String commentaire = t.getCommentaire();
            %>

            <tr>
                <td>
                    <span class="phase-tag"><%= t.getTitre() %></span>
                </td>

                <td><%= t.getDescription() %></td>

                <td><%= (t.getDateEcheance() != null && !t.getDateEcheance().isEmpty()) ? t.getDateEcheance() : "-" %></td>

                <td><%= t.getDureeEstimee() %></td>

                <td>
                    <% if ("Terminé".equals(s)) { %>
                        <span class="badge badge-termine">✅ Terminé</span>
                    <% } else if ("Problème".equals(s)) { %>
                        <span class="badge badge-probleme">⚠ Problème</span>
                    <% } else if ("En cours".equals(s)) { %>
                        <span class="badge badge-encours">⏳ En cours</span>
                    <% } else { %>
                        <span class="badge badge-attente">📌 En attente</span>
                    <% } %>

                    <form action="TaskServlet" method="post" class="inline-form">
                        <input type="hidden" name="action" value="updateStatus">
                        <input type="hidden" name="id" value="<%= t.getId() %>">

                        <select name="newStatut" onchange="toggleComment(this, <%= t.getId() %>)">
                            <option value="En attente de traitement" <%= "En attente de traitement".equals(s) ? "selected" : "" %>>En attente de traitement</option>
                            <option value="En cours" <%= "En cours".equals(s) ? "selected" : "" %>>En cours</option>
                            <option value="Problème" <%= "Problème".equals(s) ? "selected" : "" %>>Problème</option>
                            <option value="Terminé" <%= "Terminé".equals(s) ? "selected" : "" %>>Terminé</option>
                        </select>

                        <input
                            type="text"
                            name="newCommentaire"
                            id="comment-<%= t.getId() %>"
                            placeholder="Décrire le problème"
                            value="<%= commentaire != null ? commentaire : "" %>"
                            style="<%= "Problème".equals(s) ? "display:inline-block;" : "display:none;" %>">

                        <input type="submit" value="Mettre à jour" class="btn-small">
                    </form>
                </td>

                <td>
                    <% if (commentaire != null && !commentaire.trim().isEmpty()) { %>
                        <div class="comment-display"><%= commentaire %></div>
                    <% } else { %>
                        <span class="muted">-</span>
                    <% } %>
                </td>

                <td>
                    <a class="btn btn-danger btn-small" href="TaskServlet?action=delete&id=<%= t.getId() %>">🗑️ Supprimer</a>
                </td>
            </tr>

            <% } %>

            </tbody>
        </table>

        <% } %>

        <div class="link-row">
            <a href="TaskServlet?action=form" class="btn">➕ Ajouter une tâche</a>
            <a href="index.jsp" class="btn btn-secondary">⬅ Retour accueil</a>
        </div>
    </div>

</div>

</body>
</html>
