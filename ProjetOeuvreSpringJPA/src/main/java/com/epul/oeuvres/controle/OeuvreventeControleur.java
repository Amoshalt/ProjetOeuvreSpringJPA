package com.epul.oeuvres.controle;

import com.epul.oeuvres.dao.OeuvreventeService;
import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.OeuvreventeEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            List<OeuvreventeEntity> oeuvreventeEntityList = unService.consulterListeOeuvreventes();
            for (OeuvreventeEntity oeuvreventeEntity: oeuvreventeEntityList) {

            }
            request.setAttribute("mesOeuvresventes", oeuvreventeEntityList);
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
}
