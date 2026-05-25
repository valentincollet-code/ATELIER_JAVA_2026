
package model;

public class Task {

    private String titre;
    private String description;
    private String dateEcheance;
    private String statut;

    // Constructeur vide
    public Task() {
    }

    // Constructeur avec paramètres (optionnel)
    public Task(String titre, String description, String dateEcheance, String statut) {
        this.titre = titre;
        this.description = description;
        this.dateEcheance = dateEcheance;
        this.statut = statut;
    }

    // Getter / Setter titre
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    // Getter / Setter description
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Getter / Setter date
    public String getDateEcheance() {
        return dateEcheance;
    }

    public void setDateEcheance(String dateEcheance) {
        this.dateEcheance = dateEcheance;
    }

    // Getter / Setter statut
    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }
}

