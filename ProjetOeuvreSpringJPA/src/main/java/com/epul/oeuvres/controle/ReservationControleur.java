package com.epul.oeuvres.controle;

import com.epul.oeuvres.dao.AdherentService;
import com.epul.oeuvres.dao.OeuvreventeService;
import com.epul.oeuvres.dao.ReservationService;
import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.AdherentEntity;
import com.epul.oeuvres.metier.OeuvreventeEntity;
import com.epul.oeuvres.metier.ReservationEntity;
import com.epul.oeuvres.utilitaires.FonctionsUtiles;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.sql.Date;

@Controller
public class ReservationControleur {
    private static final Logger logger = LoggerFactory.getLogger(MultiControleur.class);

    @RequestMapping(value = "reserverOeuvre.htm")
    public ModelAndView reserverOeuvre(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            AdherentService adherentService = new AdherentService();
            OeuvreventeService oeuvreVenteService = new OeuvreventeService();

            OeuvreventeEntity oeuvreventeEntity = oeuvreVenteService.getOeuvreEntityById(
                    Integer.valueOf(request.getParameter("idOeuvrevente"))
            );

            request.setAttribute("adherents", adherentService.consulterListeAdherents());
            request.setAttribute("oeuvre", oeuvreventeEntity);

            destinationPage = "reserverOeuvre";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }

        return new ModelAndView(destinationPage);
    }

    @RequestMapping(value = "confirmerReservation.htm")
    public ModelAndView confirmerReservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String destinationPage;
        try {
            AdherentService adherentService = new AdherentService();
            OeuvreventeService oeuvreVenteService = new OeuvreventeService();
            ReservationService reservationService = new ReservationService();
            ReservationEntity reservationEntity = new ReservationEntity();

            AdherentEntity adherentEntity = adherentService.adherentById(Integer.valueOf(request.getParameter("idAdherent")));
            OeuvreventeEntity oeuvreventeEntity = oeuvreVenteService.getOeuvreEntityById(Integer.valueOf(request.getParameter("idOeuvrevente")));

            Date date = FonctionsUtiles.conversionChaineenDate(request.getParameter("date"),"yyyy-MM-dd");

            reservationEntity.setIdAdherent(adherentEntity.getIdAdherent());
            reservationEntity.setDateReservation(date);
            reservationEntity.setIdOeuvrevente(oeuvreventeEntity.getIdOeuvrevente());
            reservationEntity.setStatut("confirmee");

            oeuvreventeEntity.setEtatOeuvrevente("R");

            reservationService.insertReservation(reservationEntity);
            oeuvreVenteService.updateOeuvreVente(oeuvreventeEntity);
            destinationPage = "listerOeuvres";
        } catch (Exception e) {
            request.setAttribute("MesErreurs", e.getMessage());
            destinationPage = "Erreur";
        }
        return new ModelAndView(destinationPage);
    }
}
