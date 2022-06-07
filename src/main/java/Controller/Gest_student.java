package Controller;


import com.example.projetjspgest.Absence;
import com.example.projetjspgest.Connexion;
import com.example.projetjspgest.Eleve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Gest_student {

    public List<Eleve> Afficher(){
        List<Eleve> El=new ArrayList<>();
        try{
            Connection link = Connexion.connect();
            String QUERY ="select * from eleve";
            Statement stm= link.createStatement();
            ResultSet rs = stm.executeQuery(QUERY);
            while (rs.next()){
               El.add(new Eleve(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return El;
    }

    public void Ajoute_etd(Eleve eleve)  {
        try{
            Connection link = Connexion.connect();
            String query = String.format("insert into eleve(nom,prenom,groupe) values ('%s','%s',%d)",
                    eleve.getNom(),eleve.getPrenom(),eleve.getGroupe() );
            PreparedStatement ps = link.prepareStatement(query);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    public  void Modifier_Etd(Eleve eleve,int cne){
        try {
            Connection link = Connexion.connect();
            String query = String.format("UPDATE `eleve` SET `nom`='%s',`prenom`='%s',`groupe`='%d' WHERE cne = %d",
                    eleve.getNom(),eleve.getPrenom(),eleve.getGroupe(),cne );
            PreparedStatement ps = link.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void Supp_etd(int cne){
        try {
            Connection link = Connexion.connect();
            String query = String.format("delete from eleve where cne=%d",cne );
            PreparedStatement ps = link.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Absence> AfficherAB(int cne){

        List<Absence> AB=new ArrayList<>();
        try{
            Connection link = Connexion.connect();
            String QUERY ="SELECT semaine, nbr_abs from absence c , eleve a where c.cne ="+cne+" and c.cne=a.cne order by nbr_abs";
            Statement stm= link.createStatement();
            ResultSet rs = stm.executeQuery(QUERY);
            while (rs.next()){
                AB.add(new Absence(rs.getInt(1), rs.getInt(2) ));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return AB;
    }

    public void Ajoute_AB(Absence absence) {
        try {
            Connection link = Connexion.connect();
            String query = String.format("INSERT INTO `absence`(`semaine`, `cne`, `nbr_abs`) VALUES (%d,%d,%d)",
                    absence.getSemaine(), absence.getCne(), absence.getNbr_abs());
            PreparedStatement ps = link.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   /* public List<Absence> AfficherCNE(){
        List<Absence> AB = new ArrayList<>();
        try{
            Connection link = Connexion.connect();
            String QUERY ="select cne from absence";
            Statement stm= link.createStatement();
            ResultSet rs = stm.executeQuery(QUERY);
            while (rs.next()){
                AB.add(new Absence(rs.getInt(1)));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return AB;
    }*/

}
