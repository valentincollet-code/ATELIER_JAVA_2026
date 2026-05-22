<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Les Boucles - Atelier Java 2026</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #0f0f1e;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 50%, #667eea 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            z-index: -2;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .blob {
            position: fixed;
            border-radius: 50%;
            opacity: 0.1;
            z-index: -1;
            filter: blur(40px);
        }

        .blob-1 {
            width: 400px;
            height: 400px;
            background: #ff006e;
            top: -50px;
            left: -50px;
            animation: blob1 8s infinite;
        }

        .blob-2 {
            width: 350px;
            height: 350px;
            background: #00f5ff;
            bottom: 100px;
            right: 50px;
            animation: blob2 10s infinite;
        }

        @keyframes blob1 {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(100px, 100px); }
        }

        @keyframes blob2 {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(-100px, -100px); }
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 40px 20px;
            position: relative;
            z-index: 1;
        }

        header {
            text-align: center;
            color: white;
            margin-bottom: 50px;
        }

        header h1 {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(120deg, #ffffff, #87ceeb);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
            filter: drop-shadow(0 0 10px rgba(255, 157, 251, 0.3));
        }

        header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .nav-back {
            display: inline-block;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .nav-back:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateX(-5px);
        }

        .input-section {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 40px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: white;
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 1rem;
        }

        .form-group input[type="text"] {
            width: 100%;
            max-width: 300px;
            padding: 12px 15px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.05);
            color: white;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-group input[type="text"]::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .form-group input[type="text"]:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.6);
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.2);
        }

        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 35px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.5);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .exercise-section {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }

        .exercise-section h2 {
            color: white;
            font-size: 1.5rem;
            margin-bottom: 10px;
            background: linear-gradient(120deg, #ffffff, #87ceeb);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .exercise-section > p:first-of-type {
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 20px;
            font-size: 0.95rem;
        }

        .result-box {
            background: rgba(255, 255, 255, 0.05);
            border-left: 4px solid #667eea;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
            font-family: 'Courier New', monospace;
            color: #00ff88;
            min-height: 60px;
            display: flex;
            align-items: center;
            overflow-x: auto;
        }

        .star {
            display: inline-block;
            color: #ffd700;
            font-size: 1.5rem;
            margin-right: 8px;
            text-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
            animation: twinkle 2s infinite;
        }

        .star:nth-child(odd) { animation-delay: 0s; }
        .star:nth-child(even) { animation-delay: 0.3s; }
        .star:nth-child(3n) { animation-delay: 0.6s; }

        @keyframes twinkle {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        .line-break {
            height: 0;
            margin: 15px 0;
        }

        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            .exercise-section {
                padding: 20px;
            }

            .result-box {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="container">
        <a href="index.html" class="nav-back">← Retour au sommaire</a>

        <header>
            <h1>🔄 Exercices sur les Boucles</h1>
            <p>Maîtrisez les boucles en créant des patterns</p>
        </header>

        <div class="input-section">
            <form action="#" method="post">
                <div class="form-group">
                    <label for="inputValeur">Saisir le nombre d'étoiles (2-20) :</label>
                    <input type="text" id="inputValeur" name="valeur" placeholder="Exemple: 5" />
                </div>
                <button type="submit" class="btn-submit">✨ Afficher les résultats</button>
            </form>
        </div>

        <% String valeur = request.getParameter("valeur"); %>
        <% if (valeur != null && !valeur.isEmpty()) { %>
            <% int cpt = Integer.parseInt(valeur); %>

            <div class="exercise-section">
                <h2>Exercice 1 : La ligne d'étoiles</h2>
                <p>Affichage simple d'une ligne d'étoiles</p>
                <div class="result-box">
                    <% for (int i = 1; i <= cpt; i++) { %>
                        <span class="star">★</span>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 2 : Le carré d'étoiles</h2>
                <p>Ecrire le code afin de produire un carré d'étoile</p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px;">
                    <% for (int i = 1; i <= cpt; i++) { %>
                        <% for (int j = 1; j <= cpt; j++) { %>
                            <span class="star">★</span>
                        <% } %>
                        <div class="line-break"></div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 3 : Triangle rectangle gauche</h2>
                <p>Créer un triangle qui s'agrandit ligne par ligne</p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px;">
                    <% for (int i = 1; i <= cpt; i++) { %>
                        <% for (int j = 1; j <= i; j++) { %>
                            <span class="star">★</span>
                        <% } %>
                        <div class="line-break"></div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 4 : Triangle rectangle inversé</h2>
                <p>Triangle qui rétrécit ligne par ligne</p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px;">
                    <% for (int i = cpt; i >= 1; i--) { %>
                        <% for (int j = 1; j <= i; j++) { %>
                            <span class="star">★</span>
                        <% } %>
                        <div class="line-break"></div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 5 : Triangle rectangle aligné droite</h2>
                <p>Triangle aligné sur la droite avec espaces</p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px; font-family: 'Courier New', monospace;">
                    <% for (int i = 1; i <= cpt; i++) { %>
                        <% for (int j = 1; j <= (cpt - i); j++) { %>
                            <span style="margin-right: 8px;">·</span>
                        <% } %>
                        <% for (int k = 1; k <= i; k++) { %>
                            <span class="star">★</span>
                        <% } %>
                        <div class="line-break"></div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 6 : Triangle isocèle</h2>
                <p>Triangle centré en haut</p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px; justify-content: center;">
                    <% for (int i = 1; i <= cpt; i++) { %>
                        <div style="width: 100%; text-align: center; margin-bottom: 5px;">
                            <% for (int k = 1; k <= i; k++) { %>
                                <span class="star">★</span>
                            <% } %>
                        </div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 7 : Le demi losange</h2>
                <p>Forme de losange</p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px; justify-content: center;">
                    <% for (int i = 1; i <= cpt; i++) { %>
                        <div style="width: 100%; text-align: center; margin-bottom: 5px;">
                            <% for (int k = 1; k <= i; k++) { %>
                                <span class="star">★</span>
                            <% } %>
                        </div>
                    <% } %>
                    <% for (int i = cpt - 1; i >= 1; i--) { %>
                        <div style="width: 100%; text-align: center; margin-bottom: 5px;">
                            <% for (int k = 1; k <= i; k++) { %>
                                <span class="star">★</span>
                            <% } %>
                        </div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>Exercice 8 : Table de multiplication</h2>
                <p>Table de multiplication du nombre <%= cpt %></p>
                <div class="result-box" style="flex-wrap: wrap; align-items: flex-start; height: auto; padding: 20px; color: #87ceeb;">
                    <% for (int i = 1; i <= 10; i++) { %>
                        <div style="width: 100%; margin-bottom: 8px; color: #87ceeb;">
                            <%= cpt %> × <%= i %> = <strong><%= cpt * i %></strong>
                        </div>
                    <% } %>
                </div>
            </div>

        <% } %>
    </div>
</body>
</html>
