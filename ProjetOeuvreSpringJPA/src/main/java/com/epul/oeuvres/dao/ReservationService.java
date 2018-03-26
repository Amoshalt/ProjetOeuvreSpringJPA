package com.epul.oeuvres.dao;

import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.OeuvreventeEntity;
import com.epul.oeuvres.metier.ReservationEntity;

import javax.persistence.EntityTransaction;
public class ReservationService extends Service{
    public void reserverOeuvre(ReservationEntity reservation) throws MonException {
        try {
            EntityTransaction transac = startTransaction();
            transac.begin();

            // Inserérer une réservation
            entitymanager.persist(reservation);

            // Modifier l'état
            OeuvreventeService oeuvreVenteService = new OeuvreventeService();
            OeuvreventeEntity oeuvreventeEntity = oeuvreVenteService.getOeuvreEntityById(reservation.getIdOeuvrevente());
            oeuvreventeEntity.setEtatOeuvrevente("R");

            transac.commit();
            entitymanager.close();
        } catch (RuntimeException e) {
            new MonException("Erreur de lecture", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
