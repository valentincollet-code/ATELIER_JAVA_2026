ackage servlet;

import model.Task;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class TaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @SuppressWarnings("unchecked")
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");

        if (taches == null) {
            taches = new ArrayList<Task>();
            session.setAttribute("taches", taches);
        }

        String action = request.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = "list";
        }

        switch (action) {
            case "form":
                request.getRequestDispatcher("addTask.jsp").forward(request, response);
                break;

            case "add":
                ajouterTache(request, taches);
                response.sendRedirect("TaskServlet?action=list");
                break;

            case "delete":
                supprimerTache(request, taches);
                response.sendRedirect("TaskServlet?action=list");
                break;

            case "updateStatus":
                modifierStatut(request, taches);
                response.sendRedirect("TaskServlet?action=list");
                break;

            case "list":
            default:
                alimenterCompteurs(request, taches);
                request.setAttribute("taches", taches);
                request.getRequestDispatcher("taches.jsp").forward(request, response);
                break;
        }
    }

    private void ajouterTache(HttpServletRequest request, ArrayList<Task> taches) {
        String titre = request.getParameter("titre");
        String dateEcheance = request.getParameter("dateEcheance");
        String statut = request.getParameter("statut");

        if (titre == null || titre.trim().isEmpty()) {
            return;
        }

        String description = genererDescription(titre);
        String duree = genererDuree(titre);

        if (statut == null || statut.trim().isEmpty()) {
            statut = "En attente de traitement";
        }

        Task t = new Task();
        t.setId(genererNouvelId(taches));
        t.setTitre(titre);
        t.setDescription(description);
        t.setDateEcheance(dateEcheance);
        t.setStatut(statut);
        t.setDureeEstimee(duree);
        t.setCommentaire("");

        taches.add(t);
    }

    private void supprimerTache(HttpServletRequest request, ArrayList<Task> taches) {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            return;
        }

        int id = Integer.parseInt(idParam);

        for (int i = 0; i < taches.size(); i++) {
            if (taches.get(i).getId() == id) {
                taches.remove(i);
                break;
            }
        }
    }

    private void modifierStatut(HttpServletRequest request, ArrayList<Task> taches) {
        String idParam = request.getParameter("id");
        String newStatut = request.getParameter("newStatut");
        String newCommentaire = request.getParameter("newCommentaire");

        if (idParam == null || newStatut == null) {
            return;
        }

        int id = Integer.parseInt(idParam);

        for (Task t : taches) {
            if (t.getId() == id) {
                t.setStatut(newStatut);

                if ("Probl\u00E8me".equals(newStatut)) {
                    t.setCommentaire(newCommentaire != null ? newCommentaire : "");
                } else {
                    t.setCommentaire("");
                }
                break;
            }
        }
    }

    private int genererNouvelId(ArrayList<Task> taches) {
        int max = 0;
        for (Task t : taches) {
            if (t.getId() > max) {
                max = t.getId();
            }
        }
        return max + 1;
    }

    private String genererDescription(String titre) {
        if ("Gros oeuvre".equals(titre)) {
            return "Terrassement; Fondations; Soubassement; Dallage; \u00C9l\u00E9vation des murs; Charpente; Menuiseries ext\u00E9rieures.";
        } else if ("Second oeuvre".equals(titre)) {
            return "Isolation; Cloisonnement; \u00C9lectricit\u00E9; Plomberie et chauffage; Chape; Ravalement.";
        } else if ("Finitions".equals(titre)) {
            return "Rev\u00EAtements murs et sols; Menuiseries int\u00E9rieures; Installation des \u00E9quipements.";
        }
        return "";
    }

    private String genererDuree(String titre) {
        if ("Gros oeuvre".equals(titre)) {
            return "14 semaines";
        } else if ("Second oeuvre".equals(titre)) {
            return "14 semaines";
        } else if ("Finitions".equals(titre)) {
            return "10 semaines";
        }
        return "";
    }

    private void alimenterCompteurs(HttpServletRequest request, ArrayList<Task> taches) {
        int total = taches.size();
        int attente = 0;
        int encours = 0;
        int probleme = 0;
        int termine = 0;

        for (Task t : taches) {
            String statut = t.getStatut();

            if ("En cours".equals(statut)) {
                encours++;
            } else if ("Probl\u00E8me".equals(statut)) {
                probleme++;
            } else if ("Termin\u00E9".equals(statut)) {
                termine++;
            } else {
                attente++;
            }
        }

        request.setAttribute("total", total);
        request.setAttribute("attente", attente);
        request.setAttribute("encours", encours);
        request.setAttribute("probleme", probleme);
        request.setAttribute("termine", termine);
    }
}
