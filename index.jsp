<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Suivi de chantier</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="page">

    <header class="site-header">
        <div class="logo-wrap">
            <div class="logo-icon">🏗️</div>

            <div class="logo-block">
                <div class="logo-kicker">Gestion & Suivi</div>
                <h1 class="logo-title">Suivi <span>Chantier</span></h1>
                <div class="logo-line"></div>
                <p class="logo-subtitle">
                    Gestion des tâches de construction, suivi d’avancement, délais estimés
                    et remontée des problèmes rencontrés sur le chantier.
                </p>
            </div>
        </div>
    </header>

    <section class="nav-section">
        <div class="nav-grid">
            <a href="TaskServlet?action=form" class="nav-card">
                <span class="icon">➕</span>
                <h3>Ajouter une tâche</h3>
                <p>
                    Créer une nouvelle phase de chantier avec description automatique,
                    date d’échéance et statut initial.
                </p>
            </a>

            <a href="TaskServlet?action=list" class="nav-card">
                <span class="icon">📋</span>
                <h3>Voir les tâches</h3>
                <p>
                    Suivre l’avancement, modifier les statuts,
                    ajouter des commentaires et supprimer une tâche.
                </p>
            </a>
        </div>
    </section>

</div>

</body>
</html>