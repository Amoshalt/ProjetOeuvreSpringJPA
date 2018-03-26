package com.epul.oeuvres.controle;

import com.epul.oeuvres.dao.AdherentService;
import com.epul.oeuvres.dao.ProprietaireService;
import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.AdherentEntity;
import com.epul.oeuvres.metier.ProprietaireEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by tardy on 26/03/2018.
 */
@Controller
public class ProprietaireControleur {


    @RequestMapping(value = "insererProprietaire.htm")
    public ModelAndView insererProprietaire(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String destinationPage = "";
        try {
            ProprietaireEntity unProprietaire = new ProprietaireEntity();
            unProprietaire.setNomProprietaire(request.getParameter("nomProprietaire"));
            unProprietaire.setPrenomProprietaire(request.getParameter("prenomProprietaire"));
            ProprietaireService unService = new ProprietaireService();
            unService.insertProprietaire(unProprietaire);
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        destinationPage = "home";
        return new ModelAndView(destinationPage);
    }

    @RequestMapping(value = "ajouterProprietaire.htm")
    public ModelAndView ajouterProprietaire(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String destinationPage = "";
        try {
            destinationPage = "ajouterProprietaire";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }

        return new ModelAndView(destinationPage);
    }
}
