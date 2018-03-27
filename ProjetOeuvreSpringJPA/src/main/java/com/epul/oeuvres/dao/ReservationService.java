package com.epul.oeuvres.dao;

import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.OeuvreventeEntity;
import com.epul.oeuvres.metier.ReservationEntity;

import javax.persistence.EntityTransaction;
public class ReservationService extends Service{
    public void insertReservation(ReservationEntity reservation) throws MonException {
        try {
            EntityTransaction transac = startTransaction();
            transac.begin();
            entitymanager.persist(reservation);
            transac.commit();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture", e.getMessage());
        }
    }
}
