<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une tâche</title>
    <link rel="stylesheet" href="style.css">

    <script>
        function mettreAJourDescription() {
            const titre = document.getElementById("titre").value;
            const description = document.getElementById("description");

            if (titre === "Gros oeuvre") {
                description.value = "Terrassement; Fondations; Soubassement; Dallage; Élévation des murs; Charpente; Menuiseries extérieures.";
            } 
            else if (titre === "Second oeuvre") {
                description.value = "Isolation; Cloisonnement; Électricité; Plomberie et chauffage; Chape; Ravalement.";
            } 
            else if (titre === "Finitions") {
                description.value = "Revêtements murs et sols; Menuiseries intérieures; Installation des équipements.";
            } 
            else {
                description.value = "";
            }
        }

        window.onload = function() {
            mettreAJourDescription();
        };
    </script>
</head>
<body>

<div class="page">

    <header class="site-header">
        <div class="logo-wrap">
            <div class="logo-icon">🧱</div>

            <div class="logo-block">
                <div class="logo-kicker">Nouvelle phase</div>
                <h1 class="logo-title">Suivi <span>Chantier</span></h1>
                <div class="logo-line"></div>
                <p class="logo-subtitle">
                    Ajout d’une nouvelle tâche de chantier avec description métier automatique.
                </p>
            </div>
        </div>
    </header>

    <div class="card">
        <h3 class="section-title">Nouvelle tâche de chantier</h3>

        <form action="TaskServlet" method="post">
            <input type="hidden" name="action" value="add">

            <label for="titre">Phase / Titre</label>
            <select name="titre" id="titre" onchange="mettreAJourDescription()" required>
                <option value="">-- Choisir une phase --</option>
                <option value="Gros oeuvre">Gros oeuvre</option>
                <option value="Second oeuvre">Second oeuvre</option>
                <option value="Finitions">Finitions</option>
            </select>

            <label for="description">Description</label>
            <textarea name="description" id="description" readonly required></textarea>

            <div class="grid-2">
                <div>
                    <label for="dateEcheance">Date d'échéance</label>
                    <input type="date" name="dateEcheance" id="dateEcheance">
                </div>

                <div>
                    <label for="statut">Statut initial</label>
                    <select name="statut" id="statut">
                        <option value="En attente de traitement">En attente de traitement</option>
                        <option value="En cours">En cours</option>
                        <option value="Problème">Problème</option>
                        <option value="Terminé">Terminé</option>
                    </select>
                </div>
            </div>

            <div class="form-actions">
                <input type="submit" value="Ajouter la tâche">
                <a href="index.jsp" class="btn btn-secondary">⬅ Retour accueil</a>
            </div>

        </form>
    </div>

</div>

</body>
</html>
``