
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une tâche</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        label {
            font-weight: bold;
        }

        input, select, textarea {
            width: 420px;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        textarea {
            height: 110px;
        }
    </style>

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

<h2>➕ Ajouter une tâche</h2>

<form action="taches.jsp" method="post">

    <label for="titre">Phase / Titre :</label><br>
    <select name="titre" id="titre" onchange="mettreAJourDescription()" required>
        <option value="">-- Choisir une phase --</option>
        <option value="Gros oeuvre">Gros oeuvre</option>
        <option value="Second oeuvre">Second oeuvre</option>
        <option value="Finitions">Finitions</option>
    </select><br>

    <label for="description">Description :</label><br>
    <!-- ✅ readonly pour éviter modification manuelle -->
    <textarea name="description" id="description" readonly required></textarea><br>

    <label for="dateEcheance">Date d'échéance :</label><br>
    <input type="date" name="dateEcheance" id="dateEcheance"><br>

    <label for="statut">Statut initial :</label><br>
    <select name="statut" id="statut">
        <option value="En attente de traitement">En attente de traitement</option>
        <option value="En cours">En cours</option>
        <option value="Problème">Problème</option>
        <option value="Terminé">Terminé</option>
    </select><br>

    <input type="submit" value="Ajouter la tâche">

</form>

<br>
<a href="index.jsp">⬅ Retour accueil</a>

</body>
</html>
