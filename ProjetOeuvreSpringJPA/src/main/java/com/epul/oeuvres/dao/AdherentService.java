package com.epul.oeuvres.dao;

import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.AdherentEntity;

import javax.persistence.EntityTransaction;
import java.util.List;

public class AdherentService extends Service{
    public void insertAdherent(AdherentEntity unAdherent) throws MonException {
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            entitymanager.persist(unAdherent);
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



    /* Lister les adherents
     * */
    public List<AdherentEntity> consulterListeAdherents() throws MonException {
        List<AdherentEntity> mesAdherents = null;
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            mesAdherents = (List<AdherentEntity>)entitymanager.createQuery("SELECT a FROM AdherentEntity a ORDER BY a.nomAdherent").getResultList();
            entitymanager.close();
        }
        catch (RuntimeException e)
        {
            new MonException("Erreur de lecture", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mesAdherents;
    }

    /* Consultation d'une adherent par son numéro
     */
    public AdherentEntity adherentById(int idAdherent) throws MonException {
        AdherentEntity adherent;
        try {
            EntityTransaction transac = startTransaction();
            transac.begin();

            adherent = (AdherentEntity)entitymanager.createQuery(
                    "SELECT a FROM AdherentEntity a WHERE a.idAdherent=:idAdherent")
                    .setParameter("idAdherent",idAdherent)
                    .getSingleResult();
            entitymanager.close();
        } catch (Exception e) {
            throw new MonException("Erreur de lecture", e.getMessage());
        }
        return adherent;
    }

}
