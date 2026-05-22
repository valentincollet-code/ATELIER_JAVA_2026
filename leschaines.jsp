<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Les Chaînes - Atelier Java 2026</title>
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
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 50%, #667eea 100%);
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
            background: #00ff88;
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
            background: linear-gradient(120deg, #ffffff, #38f9d7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
            filter: drop-shadow(0 0 10px rgba(67, 233, 123, 0.3));
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
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            color: #0f0f1e;
            padding: 12px 35px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(67, 233, 123, 0.3);
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(67, 233, 123, 0.5);
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
            background: linear-gradient(120deg, #ffffff, #38f9d7);
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
            border-left: 4px solid #43e97b;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
            color: #00ff88;
            min-height: 60px;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            font-weight: 600;
            word-break: break-all;
        }

        .vertical-display {
            display: flex;
            flex-direction: column;
            gap: 8px;
            font-size: 1.2rem;
            font-weight: bold;
            color: #38f9d7;
            align-items: center;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-top: 15px;
        }

        .stat-box {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(67, 233, 123, 0.3);
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            color: #38f9d7;
        }

        .stat-box strong {
            display: block;
            font-size: 1.8rem;
            margin: 10px 0;
            color: #00ff88;
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
            <h1>📝 Exercices sur les Chaînes</h1>
            <p>Explorez la manipulation de texte en Java</p>
        </header>

        <div class="input-section">
            <form action="#" method="post">
                <div class="form-group">
                    <label for="chaine">Saisir une chaîne de caractères (minimum 6) :</label>
                    <input type="text" id="chaine" name="chaine" placeholder="Exemple: Bonjour" />
                </div>
                <button type="submit" class="btn-submit">✍️ Analyser</button>
            </form>
        </div>

        <% String chaine = request.getParameter("chaine"); %>
        
        <% if (chaine != null && !chaine.isEmpty()) { %>
            <% int longueurChaine = chaine.length(); %>
            <% char caractereExtrait = chaine.length() > 2 ? chaine.charAt(2) : ' '; %>
            <% String sousChaine = chaine.length() > 5 ? chaine.substring(2, Math.min(6, chaine.length())) : "N/A"; %>

            <div class="exercise-section">
                <h2>📊 Informations Générales</h2>
                <div class="stats-grid">
                    <div class="stat-box">
                        <span>Longueur</span>
                        <strong><%= longueurChaine %></strong>
                        <span>caractères</span>
                    </div>
                    <div class="stat-box">
                        <span>3ème caractère</span>
                        <strong><%= caractereExtrait %></strong>
                    </div>
                    <div class="stat-box">
                        <span>Sous-chaîne</span>
                        <strong><%= sousChaine %></strong>
                    </div>
                </div>
            </div>

            <div class="exercise-section">
                <h2>🔍 Exercice 1 : Compter les "e"</h2>
                <p>Combien de lettres "e" contient votre texte ?</p>
                <% 
                    int compteurE = 0;
                    for (int i = 0; i < chaine.length(); i++) {
                        if (chaine.charAt(i) == 'e' || chaine.charAt(i) == 'E') {
                            compteurE++;
                        }
                    }
                %>
                <div class="result-box">
                    📌 Résultat : <strong><%= compteurE %></strong> lettre(s) 'e' trouvée(s)
                </div>
            </div>

            <div class="exercise-section">
                <h2>⬇️ Exercice 2 : Affichage Vertical</h2>
                <p>Affichage du texte en vertical, lettre par lettre</p>
                <div class="result-box">
                    <div class="vertical-display">
                        <% for (int i = 0; i < chaine.length(); i++) { %>
                            <span><%= chaine.charAt(i) %></span>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="exercise-section">
                <h2>📍 Exercice 3 : Ligne par Ligne</h2>
                <p>Chaque espace crée un retour à la ligne</p>
                <div class="result-box" style="flex-direction: column; align-items: flex-start;">
                    <% String[] parts = chaine.split(" "); %>
                    <% for (String part : parts) { %>
                        <div style="margin: 5px 0; font-weight: bold; color: #38f9d7;"><%= part %></div>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>🎯 Exercice 4 : Une lettre sur deux</h2>
                <p>Affichage d'une lettre sur deux</p>
                <div class="result-box">
                    <% for (int i = 0; i < chaine.length(); i += 2) { %>
                        <%= chaine.charAt(i) %>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>🔀 Exercice 5 : Texte Inversé (Verlan)</h2>
                <p>Affichage du texte à l'envers</p>
                <div class="result-box">
                    <% for (int i = chaine.length() - 1; i >= 0; i--) { %>
                        <%= chaine.charAt(i) %>
                    <% } %>
                </div>
            </div>

            <% 
                int nbVoyelles = 0;
                int nbConsonnes = 0;
                String texteMin = chaine.toLowerCase();
                
                for (int i = 0; i < texteMin.length(); i++) {
                    char c = texteMin.charAt(i);
                    if (c >= 'a' && c <= 'z') {
                        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y') {
                            nbVoyelles++;
                        } else {
                            nbConsonnes++;
                        }
                    }
                }
            %>

            <div class="exercise-section">
                <h2>🎼 Exercice 6 : Voyelles et Consonnes</h2>
                <p>Analyse des voyelles et consonnes dans votre texte</p>
                <div class="stats-grid">
                    <div class="stat-box">
                        <span>Voyelles</span>
                        <strong><%= nbVoyelles %></strong>
                        <span>(a,e,i,o,u,y)</span>
                    </div>
                    <div class="stat-box">
                        <span>Consonnes</span>
                        <strong><%= nbConsonnes %></strong>
                    </div>
                    <div class="stat-box">
                        <span>Ratio</span>
                        <strong><%= nbVoyelles + nbConsonnes > 0 ? String.format("%.1f%%", (nbVoyelles * 100.0) / (nbVoyelles + nbConsonnes)) : "N/A" %></strong>
                        <span>voyelles</span>
                    </div>
                </div>
            </div>

        <% } %>
    </div>
</body>
</html>
