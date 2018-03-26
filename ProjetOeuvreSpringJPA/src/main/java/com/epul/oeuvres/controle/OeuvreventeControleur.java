package com.epul.oeuvres.controle;

import com.epul.oeuvres.dao.OeuvreventeService;
import com.epul.oeuvres.dao.ProprietaireService;
import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.OeuvreventeEntity;
import com.epul.oeuvres.metier.ProprietaireEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * Created by tardy on 26/03/2018.
 */
@Controller
public class OeuvreventeControleur {

    @RequestMapping(value = "listerOeuvres.htm")
    public ModelAndView afficherLesStages(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            // HttpSession session = request.getSession();
            OeuvreventeService unService = new OeuvreventeService();
            ProprietaireService proprietaireService = new ProprietaireService();
            List<OeuvreventeEntity> oeuvreventeEntityList = unService.consulterListeOeuvreventes();
            HashMap<Integer,ProprietaireEntity> proprietaireEntityList = proprietaireService.consulterListeProprietaires();

            request.setAttribute("mesOeuvresventes", oeuvreventeEntityList);
            request.setAttribute("proprietaires", proprietaireEntityList);
            destinationPage = "listerOeuvres";
        } catch (MonException e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";

        }
        return new ModelAndView(destinationPage);
    }


    @RequestMapping(value = "insererOeuvresvente.htm")
    public ModelAndView insererOeuvresvente(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String destinationPage = "";
        try {
            OeuvreventeEntity unOeuvrevente = new OeuvreventeEntity();
            unOeuvrevente.setTitreOeuvrevente(request.getParameter("titreOeuvrevente"));
            unOeuvrevente.setEtatOeuvrevente("");
            unOeuvrevente.setPrixOeuvrevente(Double.parseDouble(request.getParameter("prixOeuvrevente")));
            OeuvreventeService unService = new OeuvreventeService();
            unService.insertOeuvrevente(unOeuvrevente);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        destinationPage = "home";
        return new ModelAndView(destinationPage);
    }

    @RequestMapping(value = "ajouterOeuvrevente.htm")
    public ModelAndView ajouterOeuvrevente(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String destinationPage = "";
        try {
            destinationPage = "ajouterOeuvrevente";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }

        return new ModelAndView(destinationPage);
    }

    @RequestMapping(value = "modifierOeuvre.htm")
    public ModelAndView modifierOeuvrevente(HttpServletRequest request, HttpServletResponse response) throws Exception {
        OeuvreventeService oeuvreventeService = new OeuvreventeService();
        String destinationPage = "";
        try {
            destinationPage = "modifierOeuvre";

            OeuvreventeEntity oeuvreventeEntity = oeuvreventeService.getOeuvreEntityById((int)request.getAttribute("idOeuvre"));
            request.setAttribute("idOeuvrevente", oeuvreventeEntity.getIdOeuvrevente());
            request.setAttribute("titreOeuvrevente", oeuvreventeEntity.getTitreOeuvrevente());
            request.setAttribute("prixOeuvrevente", oeuvreventeEntity.getPrixOeuvrevente());
            request.setAttribute("idProprietaire", oeuvreventeEntity.getIdProprietaire());

        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }

        return new ModelAndView(destinationPage);
    }
}
