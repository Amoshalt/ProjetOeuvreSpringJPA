package com.epul.oeuvres.dao;

import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.ProprietaireEntity;

import javax.persistence.EntityTransaction;

/**
 * Created by tardy on 26/03/2018.
 */
public class ProprietaireService extends Service{

    public void insertProprietaire(ProprietaireEntity unProprietaire) throws MonException {
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            entitymanager.persist(unProprietaire);
            transac.commit();
            entitymanager.close();
        }
        catch (RuntimeException e)
        {
            new MonException("Erreur de lecture", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
