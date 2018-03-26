package com.epul.oeuvres.dao;

import com.epul.oeuvres.meserreurs.MonException;
import com.epul.oeuvres.metier.ProprietaireEntity;

import javax.persistence.EntityTransaction;
import java.util.HashMap;
import java.util.List;

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

    /* Lister les Proprietaires
     * */
    public HashMap<Integer,ProprietaireEntity> consulterListeProprietaires() throws MonException {
        List<ProprietaireEntity> mesProprietaires = null;
        HashMap<Integer, ProprietaireEntity> proprietaireEntityHashMap = new HashMap<>();
        try
        {
            EntityTransaction transac = startTransaction();
            transac.begin();
            mesProprietaires = (List<ProprietaireEntity>)entitymanager.createQuery("SELECT p FROM ProprietaireEntity p ORDER BY p.nomProprietaire").getResultList();
            entitymanager.close();
            for (ProprietaireEntity proprietaireEntity: mesProprietaires) {
                proprietaireEntityHashMap.put(proprietaireEntity.getIdProprietaire(),proprietaireEntity);
            }
        }
        catch (RuntimeException e)
        {
            new MonException("Erreur de lecture", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return proprietaireEntityHashMap;
    }
}
