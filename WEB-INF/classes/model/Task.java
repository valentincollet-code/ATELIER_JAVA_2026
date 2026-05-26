
package model;

public class Task {

    private String titre;
    private String description;
    private String dateEcheance;
    private String statut;
    private String dureeEstimee;
    private String commentaire;

    // Constructeur vide
    public Task() {
    }

    // Constructeur complet
    public Task(String titre, String description, String dateEcheance, String statut,
                String dureeEstimee, String commentaire) {
        this.titre = titre;
        this.description = description;
        this.dateEcheance = dateEcheance;
        this.statut = statut;
        this.dureeEstimee = dureeEstimee;
        this.commentaire = commentaire;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateEcheance() {
        return dateEcheance;
    }

    public void setDateEcheance(String dateEcheance) {
        this.dateEcheance = dateEcheance;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public String getDureeEstimee() {
        return dureeEstimee;
    }

    public void setDureeEstimee(String dureeEstimee) {
        this.dureeEstimee = dureeEstimee;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
}


