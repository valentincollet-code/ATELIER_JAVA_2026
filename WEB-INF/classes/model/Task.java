
package model;

public class Task {

    private int id;
    private String titre;
    private String description;
    private String phase;
    private String lot;
    private String artisan;
    private String statut;
    private String approvisionnement;
    private String commentaire;
    private String dateEcheance;
    private boolean terminee;

    // Constructeur vide
    public Task() {
    }

    // Constructeur complet
    public Task(int id, String titre, String description, String phase,
                String lot, String artisan, String statut,
                String approvisionnement, String commentaire,
                String dateEcheance, boolean terminee) {

        this.id = id;
        this.titre = titre;
        this.description = description;
        this.phase = phase;
        this.lot = lot;
        this.artisan = artisan;
        this.statut = statut;
        this.approvisionnement = approvisionnement;
        this.commentaire = commentaire;
        this.dateEcheance = dateEcheance;
        this.terminee = terminee;
    }

    // Getters et Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    public String getLot() {
        return lot;
    }

    public void setLot(String lot) {
        this.lot = lot;
    }

    public String getArtisan() {
        return artisan;
    }

    public void setArtisan(String artisan) {
        this.artisan = artisan;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public String getApprovisionnement() {
        return approvisionnement;
    }

    public void setApprovisionnement(String approvisionnement) {
        this.approvisionnement = approvisionnement;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public String getDateEcheance() {
        return dateEcheance;
    }

    public void setDateEcheance(String dateEcheance) {
        this.dateEcheance = dateEcheance;
    }

    public boolean isTerminee() {
        return terminee;
    }

    public void setTerminee(boolean terminee) {
        this.terminee = terminee;
    }
}
