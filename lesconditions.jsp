<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Les Conditions - Atelier Java 2026</title>
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
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 50%, #667eea 100%);
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
            background: #00f5ff;
            top: -50px;
            left: -50px;
            animation: blob1 8s infinite;
        }

        .blob-2 {
            width: 350px;
            height: 350px;
            background: #0099ff;
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
            background: linear-gradient(120deg, #ffffff, #00f2fe);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
            filter: drop-shadow(0 0 10px rgba(79, 172, 254, 0.3));
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
            max-width: 250px;
            padding: 12px 15px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.05);
            color: white;
            font-size: 1rem;
            transition: all 0.3s ease;
            margin-right: 15px;
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

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .btn-submit {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: #0f0f1e;
            padding: 12px 35px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(79, 172, 254, 0.3);
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(79, 172, 254, 0.5);
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
            background: linear-gradient(120deg, #ffffff, #00f2fe);
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
            border-left: 4px solid #4facfe;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
            color: #00ff88;
            min-height: 60px;
            display: flex;
            align-items: center;
            font-weight: 600;
        }

        .result-bad {
            border-left-color: #ff4757;
            color: #ff7f7f;
        }

        .result-good {
            border-left-color: #2ed573;
            color: #00ff88;
        }

        .result-equal {
            border-left-color: #ffa502;
            color: #ffc107;
        }

        @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            .form-row {
                flex-direction: column;
                gap: 10px;
            }

            .form-group input[type="text"] {
                max-width: 100%;
                margin-right: 0;
            }

            .exercise-section {
                padding: 20px;
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
            <h1>❓ Exercices sur les Conditions</h1>
            <p>Développez votre logique conditionnelle</p>
        </header>

        <div class="input-section">
            <form action="#" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="valeur1">Valeur 1 :</label>
                        <input type="text" id="valeur1" name="valeur1" placeholder="Ex: 10" />
                    </div>
                    <div class="form-group">
                        <label for="valeur2">Valeur 2 :</label>
                        <input type="text" id="valeur2" name="valeur2" placeholder="Ex: 20" />
                    </div>
                </div>
                <button type="submit" class="btn-submit">🔍 Analyser</button>
            </form>
        </div>

        <% String valeur1 = request.getParameter("valeur1"); %>
        <% String valeur2 = request.getParameter("valeur2"); %>

        <% if (valeur1 != null && valeur2 != null && !valeur1.isEmpty() && !valeur2.isEmpty()) { %>
            <% int intValeur1 = Integer.parseInt(valeur1); %>
            <% int intValeur2 = Integer.parseInt(valeur2); %>

            <div class="exercise-section">
                <h2>📊 Comparaison Simple</h2>
                <p>Résultat de la comparaison entre <%= intValeur1 %> et <%= intValeur2 %></p>
                <div class="result-box <%= intValeur1 > intValeur2 ? "result-good" : intValeur1 < intValeur2 ? "result-bad" : "result-equal" %>">
                    <% if (intValeur1 > intValeur2) { %>
                        ✓ Valeur 1 (<%=intValeur1%>) est SUPÉRIEURE à Valeur 2 (<%=intValeur2%>)
                    <% } else if (intValeur1 < intValeur2) { %>
                        ✗ Valeur 1 (<%=intValeur1%>) est INFÉRIEURE à Valeur 2 (<%=intValeur2%>)
                    <% } else { %>
                        ⚖ Valeur 1 (<%=intValeur1%>) est ÉGALE à Valeur 2 (<%=intValeur2%>)
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>🎯 Exercice 1 : Intervalle</h2>
                <p>La valeur C (15) est-elle comprise entre A et B ?</p>
                <% 
                    int A = intValeur1;
                    int B = intValeur2;
                    int C = 15;
                %>
                <div class="result-box <%= ((C >= A && C <= B) || (C >= B && C <= A)) ? "result-good" : "result-bad" %>">
                    <% if ((C >= A && C <= B) || (C >= B && C <= A)) { %>
                        ✓ OUI, <%= C %> est compris entre <%= A %> et <%= B %>
                    <% } else { %>
                        ✗ NON, <%= C %> n'est pas compris entre <%= A %> et <%= B %>
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>🔢 Exercice 2 : Pair ou Impair</h2>
                <p>Vérifier si <%= intValeur1 %> est pair ou impair</p>
                <% int nombre = intValeur1; %>
                <div class="result-box <%= (nombre % 2 == 0) ? "result-good" : "result-bad" %>">
                    <% if (nombre % 2 == 0) { %>
                        ✓ <%= nombre %> est un nombre PAIR
                    <% } else { %>
                        ✗ <%= nombre %> est un nombre IMPAIR
                    <% } %>
                </div>
            </div>

            <div class="exercise-section">
                <h2>📈 Exercice 3 : Valeur Plus Grande</h2>
                <p>Quelle est la plus grande valeur entre <%= intValeur1 %> et <%= intValeur2 %> ?</p>
                <div class="result-box result-good">
                    📌 La plus grande valeur est <strong><%= Math.max(intValeur1, intValeur2) %></strong>
                </div>
            </div>

            <div class="exercise-section">
                <h2>📉 Exercice 4 : Valeur Plus Petite</h2>
                <p>Quelle est la plus petite valeur entre <%= intValeur1 %> et <%= intValeur2 %> ?</p>
                <div class="result-box result-bad">
                    📌 La plus petite valeur est <strong><%= Math.min(intValeur1, intValeur2) %></strong>
                </div>
            </div>

        <% } else if (valeur1 != null || valeur2 != null) { %>
            <div class="exercise-section">
                <h2>⚠️ Veuillez remplir les deux champs</h2>
                <p>Assurez-vous de saisir deux valeurs numériques pour voir les résultats.</p>
            </div>
        <% } %>
    </div>
</body>
</html>
