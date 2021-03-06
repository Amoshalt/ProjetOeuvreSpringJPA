package com.epul.oeuvres.dao;

import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.OeuvreventeEntity;

import javax.persistence.EntityTransaction;
import java.util.List;

/**
 * Created by tardy on 26/03/2018.
 */
public class OeuvreventeService extends Service{

    public void insertOeuvrevente(OeuvreventeEntity unOeuvrevente) throws MonException {
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            entitymanager.persist(unOeuvrevente);
            transac.commit();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture durant l'insertion d'une vente", e.getMessage());
        }
    }

    /* Lister les Oeuvreventes
     * */
    public List<OeuvreventeEntity> consulterListeOeuvreventes() throws MonException {
        List<OeuvreventeEntity> mesOeuvreventes = null;
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            mesOeuvreventes = (List<OeuvreventeEntity>)entitymanager.createQuery(
                    "SELECT o FROM OeuvreventeEntity o ORDER BY o.titreOeuvrevente"
            )
                    .getResultList();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture durant consultation liste oeuvres", e.getMessage());
        }
        return mesOeuvreventes;
    }

    public OeuvreventeEntity getOeuvreEntityById(int idOeuvre) throws MonException{
        OeuvreventeEntity oeuvreventeEntity= null;
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            oeuvreventeEntity = (OeuvreventeEntity)entitymanager.createQuery(
                    "SELECT o FROM OeuvreventeEntity o WHERE o.idOeuvrevente = :id"
            )
                    .setParameter("id", idOeuvre)
                    .getSingleResult();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture durant récupération de l'oeuvre", e.getMessage());
        }
        return oeuvreventeEntity;
    }

    public void updateOeuvreVente(OeuvreventeEntity oeuvrevente) throws MonException {
        try {
            EntityTransaction transac = startTransaction();
            transac.begin();
            entitymanager.merge(oeuvrevente);
            transac.commit();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture durant mise à jour de l'oeuvre", e.getMessage());
        }
    }

    public Object getBookedOeuvres() throws MonException {
        List<Integer> bookedOeuvreventeEntityIds;
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            bookedOeuvreventeEntityIds = (List<Integer>) entitymanager.createQuery(
                    "SELECT o.idOeuvrevente FROM OeuvreventeEntity o WHERE o.etatOeuvrevente=:etat"
            )
                    .setParameter("etat", "R")
                    .getResultList();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture durant récupération de l'oeuvre", e.getMessage());
        }
        return bookedOeuvreventeEntityIds;
    }
}
