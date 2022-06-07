package com.example.projetjspgest;


public class Eleve {
    private int cne;
    private String nom;
    private String Prenom;
    private int groupe;

    public Eleve(int cne, String nom, String prenom, int groupe) {
        this.cne = cne;
        this.nom = nom;
        Prenom = prenom;
        this.groupe = groupe;
    }

    public Eleve(String nom, String prenom, int groupe) {
        this.nom = nom;
        this.Prenom = prenom;
        this.groupe = groupe;
    }

    public int getCne() {
        return cne;
    }

    public void setCne(int cne) {
        this.cne = cne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return Prenom;
    }

    public void setPrenom(String prenom) {
        Prenom = prenom;
    }

    public int getGroupe() {
        return groupe;
    }

    public void setGroupe(int groupe) {
        this.groupe = groupe;
    }
}
