#  Suivi Chantier – Mini gestionnaire de tâches collaboratif

## Présentation du projet

Ce projet est une application web développée en **Java avec JSP** dans le cadre d’un TP de **programmation Java Web**.

L’objectif est de proposer un **mini gestionnaire de tâches collaboratif** orienté **suivi de chantier de construction de maison**.

L’application permet de :
- créer des tâches,
- consulter la liste des tâches,
- suivre leur avancement,
- gérer les problèmes rencontrés,
- modifier leur statut,
- supprimer une tâche si nécessaire.

Les données sont stockées **en session utilisateur**, conformément aux consignes du TP, **sans base de données**.

---

## Pour lancement du site:

### 1. Prérequis
L’application nécessite :
- **Java JDK** installé
- **Apache Tomcat** installé

---

### 2. Copier le projet dans Tomcat

Le dossier du projet doit être placé dans le dossier :


apache-tomcat/webapps/Valentin

Le dossier du projet doit contenir:



```text

Valentin/
├── index.jsp
├── addTask.jsp
├── taches.jsp
├── style.css
├── images/
│   └── fond-maison.png
└── WEB-INF/
    ├── web.xml
    └── classes/
        ├── model/
        │   └── Task.java
        └── servlet/
            └── TaskServlet.java

```

---

### 3. Compiler les classes JAVA

Ouvrir un terminal dans le dossier:

WEB-INF/classes

Puis compiler les classes suivantes:

Compiler Task.java et TaskServlet.java:

```bash

javac model\\Task.java

javac -cp ".;C:\\chemin\\vers\\apache-tomcat\\lib\\servlet-api.jar" -d . servlet\\TaskServlet.java

```

---

### 4. Vérifier les fichiers compilés

Après compilations, les fichiers suivants doivent exister:


WEB-INF/classes/model/Task.class
WEB-INF/classes/servlet/TaskServlet.class

---

### 5. Lancer Tomcat

Dans le dossier apache-tomcat/bin, lancer startup.bat

---

### 6. Ouvrir l'application

Dans un navigateur, ouvrir l'adresse: http://localhost:8080/Valentin


Fonctionnement du site

L’application est organisée autour de 3 pages JSP principales et d’une Servlet :

- `index.jsp` → page d’accueil
- `addTask.jsp` → formulaire d’ajout d’une tâche
- `taches.jsp` → affichage de la liste des tâches
- `TaskServlet.java` → traitement des actions (ajout, suppression, mise à jour du statut, chargement des données)


Page d’accueil
La page d’accueil permet d’accéder facilement aux deux grandes fonctionnalités :

- Ajouter une tâche
- Voir les tâches


L’interface a été pensée pour être visuellement cohérente avec le thème du chantier :

arrière-plan en lien avec la construction,
design plus moderne et ergonomique,
identité visuelle du site : Suivi Chantier


Ajouter une tâche
La page Ajouter une tâche permet de créer une nouvelle tâche de chantier.
Champs du formulaire
1\. Phase / Titre
L’utilisateur choisit une des 3 grandes phases du chantier :

Gros oeuvre
Second oeuvre
Finitions


2\. Description automatique
Selon la phase sélectionnée, la description se remplit automatiquement.
Si l’utilisateur choisit Gros oeuvre
La description devient automatiquement :

Terrassement
Fondations
Soubassement
Dallage
Élévation des murs
Charpente
Menuiseries extérieures

Si l’utilisateur choisit Second oeuvre
La description devient automatiquement :

Isolation
Cloisonnement
Électricité
Plomberie et chauffage
Chape
Ravalement

Si l’utilisateur choisit Finitions
La description devient automatiquement :

Revêtements murs et sols
Menuiseries intérieures
Installation des équipements


3\. Date d’échéance
L’utilisateur peut choisir une date prévue pour la tâche.

4\. Statut initial
L’utilisateur peut choisir un statut initial parmi :

En attente de traitement
En cours
Problème
Terminé


5\. Validation
Quand l’utilisateur clique sur Ajouter la tâche, la tâche est enregistrée dans une ArrayList stockée en session.

Voir les tâches
La page Voir les tâches affiche toutes les tâches créées pendant la session.
Chaque tâche est présentée dans un tableau avec plusieurs colonnes.

Colonnes du tableau
Phase
Affiche la phase principale sélectionnée :

Gros oeuvre
Second oeuvre
Finitions


Description
Affiche la description automatique correspondant à la phase de chantier.

Date
Affiche la date d’échéance choisie lors de la création.

Durée estimée
La durée estimée est calculée automatiquement en fonction de la phase sélectionnée.
Règles utilisées :

Gros oeuvre → 14 semaines
Second oeuvre → 14 semaines
Finitions → 10 semaines

Cette colonne permet d’apporter une logique métier plus réaliste au suivi du chantier.

Statut
Le statut est affiché sous forme visuelle avec code couleur :

En attente de traitement
En cours
Problème
Terminé

Chaque statut est présenté avec une couleur différente pour améliorer la lisibilité.

Modification du statut
Depuis la page Voir les tâches, l’utilisateur peut modifier le statut d’une tâche grâce à une liste déroulante.
Il peut faire évoluer une tâche :

de En attente de traitement vers En cours
de En cours vers Terminé
ou la passer en Problème si un blocage apparaît


Gestion des problèmes et case commentaire
Une fonctionnalité spécifique a été ajoutée pour rendre l’application plus réaliste.
Quand le statut est mis sur “Problème”
Un champ commentaire apparaît automatiquement.
L’utilisateur peut alors décrire la nature du problème, par exemple :

retard de livraison,
matériau manquant,
erreur technique,
intervention bloquée,
attente d’un artisan.


Exemple
Si une tâche est passée en statut Problème, l’utilisateur peut écrire :

Retard livraison menuiseries
Plombier en attente du plan technique
Matériel non disponible

Le commentaire est ensuite affiché dans la colonne Commentaire du tableau.

Si le statut n’est plus “Problème”
Le commentaire n’est plus nécessaire et la tâche revient dans un fonctionnement normal.

Suppression des tâches
Chaque ligne du tableau contient une action Supprimer.
Cette fonctionnalité permet :

d’enlever une tâche terminée,
de retirer une tâche créée par erreur,
de garder un tableau propre.


Tableau de bord
La page Voir les tâches contient également un résumé visuel du chantier avec plusieurs indicateurs :

nombre total de tâches
nombre de tâches en attente
nombre de tâches en cours
nombre de tâches en problème
nombre de tâches terminées

Cela permet d’avoir une vision globale rapide de l’avancement.

Contraintes du TP respectées
Le projet respecte les consignes suivantes :

création d’une application web dynamique en Java avec JSP
utilisation d’une classe Java Task avec attributs privés
ajout des tâches via un formulaire JSP
stockage des tâches dans une ArrayList<Task> en session
affichage avec boucle JSP
page d’accueil avec navigation
suppression d’une tâche
gestion de la date d’échéance
possibilité de marquer une tâche comme terminée (via le statut)
