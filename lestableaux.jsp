<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Les Tableaux - Atelier Java 2026</title>
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
            background: linear-gradient(135deg, #fa709a 0%, #fee140 50%, #667eea 100%);
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
            background: #ffd700;
            top: -50px;
            left: -50px;
            animation: blob1 8s infinite;
        }

        .blob-2 {
            width: 350px;
            height: 350px;
            background: #ff69b4;
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
            background: linear-gradient(120deg, #ffffff, #fee140);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
            filter: drop-shadow(0 0 10px rgba(250, 112, 154, 0.3));
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
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .form-group input[type="text"] {
            width: 100%;
            max-width: 400px;
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
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: #0f0f1e;
            padding: 12px 35px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(250, 112, 154, 0.3);
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(250, 112, 154, 0.5);
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
            background: linear-gradient(120deg, #ffffff, #fee140);
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
            border-left: 4px solid #fa709a;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
            color: #ffd700;
            min-height: 60px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            font-weight: 600;
        }

        .array-display {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 15px;
        }

        .array-item {
            background: rgba(250, 112, 154, 0.3);
            border: 2px solid rgba(250, 112, 154, 0.6);
            padding: 12px 18px;
            border-radius: 8px;
            color: #fee140;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .array-item:hover {
            background: rgba(250, 112, 154, 0.5);
            transform: scale(1.05);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }

        .stat-box {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(250, 112, 154, 0.3);
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            color: #fee140;
        }

        .stat-box strong {
            display: block;
            font-size: 1.8rem;
            margin: 10px 0;
            color: #ffd700;
        }

        .translation {
            font-style: italic;
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.6);
            display: block;
            margin-top: 3px;
        }

        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            .exercise-section {
                padding: 20px;
            }

            .form-group input[type="text"] {
                max-width: 100%;
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
            <h1>📦 Exercices sur les Tableaux</h1>
            <p class="translation">📦 Ejercicios sobre Arreglos</p>
            <p>Maîtrisez les structures de données</p>
            <p class="translation">Domina las estructuras de datos</p>
        </header>

        <div class="input-section">
            <form action="#" method="post">
                <div class="form-group">
                    <label for="chaine">Saisir au minimum 3 nombres (séparés par des espaces) :</label>
                    <p class="translation">Ingresa al menos 3 números (separados por espacios):</p>
                    <input type="text" id="chaine" name="chaine" placeholder="Ejemplo: 10 25 15 30" />
                </div>
                <button type="submit" class="btn-submit">📊 Analyser</button>
            </form>
        </div>

        <% String chaine = request.getParameter("chaine"); %>
        
        <% if (chaine != null && !chaine.isEmpty()) { %>
            <% String[] tableauDeChiffres = chaine.split("\\s+"); %>
            <% int[] nombres = new int[tableauDeChiffres.length]; %>
            <% for (int i = 0; i < tableauDeChiffres.length; i++) { %>
                <% nombres[i] = Integer.parseInt(tableauDeChiffres[i]); %>
            <% } %>

            <div class="exercise-section">
                <h2>📋 Vue d'ensemble du Tableau</h2>
                <p>Vous avez saisi <%= tableauDeChiffres.length %> nombre(s)</p>
                <div class="array-display">
                    <% for (int i = 0; i < nombres.length; i++) { %>
                        <div class="array-item">
                            [<%= i %>] = <%= nombres[i] %>
                        </div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>🔢 Exercice 1 : Carré du premier nombre</h2>
                <p>Calculer le carré de la première valeur : <%= nombres[0] %></p>
                <div class="result-box">
                    📌 <%= nombres[0] %>² = <strong><%= nombres[0] * nombres[0] %></strong>
                </div>
            </div>

            <div class="exercise-section">
                <h2>➕ Exercice 2 : Somme des 2 premiers nombres</h2>
                <p>Additionner les deux premières valeurs</p>
                <div class="result-box">
                    📌 <%= nombres[0] %> + <%= nombres[1] %> = <strong><%= nombres[0] + nombres[1] %></strong>
                </div>
            </div>

            <% int sommeTotal = 0; %>
            <% for (int val : nombres) { %>
                <% sommeTotal += val; %>
            <% } %>

            <div class="exercise-section">
                <h2>✌️ Exercice 3 : Somme de tous les nombres</h2>
                <p>Additionner toutes les valeurs du tableau</p>
                <div class="result-box">
                    📌 Somme totale = <strong><%= sommeTotal %></strong>
                </div>
            </div>

            <% int max = nombres[0]; %>
            <% for (int val : nombres) { %>
                <% if (val > max) max = val; %>
            <% } %>

            <div class="exercise-section">
                <h2>📈 Exercice 4 : Valeur maximale</h2>
                <p>Trouver le nombre le plus grand</p>
                <div class="result-box">
                    📌 Maximum = <strong><%= max %></strong>
                </div>
            </div>

            <% int min = nombres[0]; %>
            <% for (int val : nombres) { %>
                <% if (val < min) min = val; %>
            <% } %>

            <div class="exercise-section">
                <h2>📉 Exercice 5 : Valeur minimale</h2>
                <p>Trouver le nombre le plus petit</p>
                <div class="result-box">
                    📌 Minimum = <strong><%= min %></strong>
                </div>
            </div>

            <div class="exercise-section">
                <h2>📊 Exercice 6 : Statistiques Globales</h2>
                <p>Vue d'ensemble des calculs effectués</p>
                <div class="stats-grid">
                    <div class="stat-box">
                        <span>Taille du tableau</span>
                        <strong><%= nombres.length %></strong>
                    </div>
                    <div class="stat-box">
                        <span>Somme</span>
                        <strong><%= sommeTotal %></strong>
                    </div>
                    <div class="stat-box">
                        <span>Moyenne</span>
                        <strong><%= String.format("%.2f", (double)sommeTotal / nombres.length) %></strong>
                    </div>
                    <div class="stat-box">
                        <span>Intervalle</span>
                        <strong><%= max - min %></strong>
                    </div>
                </div>
            </div>

            <% int minAbsolute = Math.abs(nombres[0]); %>
            <% int indexMinAbsolute = 0; %>
            <% for (int i = 0; i < nombres.length; i++) { %>
                <% if (Math.abs(nombres[i]) < minAbsolute) { %>
                    <% minAbsolute = Math.abs(nombres[i]); %>
                    <% indexMinAbsolute = i; %>
                <% } %>
            <% } %>

            <div class="exercise-section">
                <h2>🎯 Exercice 7 : Plus proche de zéro</h2>
                <p>Trouver la valeur la plus proche de 0</p>
                <div class="result-box">
                    📌 La valeur la plus proche de 0 est <strong><%= nombres[indexMinAbsolute] %></strong> (index <%= indexMinAbsolute %>)
                </div>
            </div>

        <% } else { %>
            <div class="exercise-section">
                <h2>⚠️ Veuillez saisir des nombres</h2>
                <p>Saisissez au minimum 3 nombres séparés par des espaces pour voir les résultats.</p>
            </div>
        <% } %>
    </div>
</body>
</html>
