package com.example.projetjspgest;
    public class Absence {
        private int semaine;
        private int cne;
        private int nbr_abs;

        public Absence(int semaine, int cne, int nbr_abs) {
            this.semaine = semaine;
            this.cne = cne;
            this.nbr_abs = nbr_abs;
        }

        public Absence(int semaine, int nbr_abs) {
            this.semaine = semaine;
            this.nbr_abs = nbr_abs;
        }

        public Absence(int cne) {
            this.cne = cne;
        }

        public int getSemaine() {
            return semaine;
        }

        public void setSemaine(int semaine) {
            this.semaine = semaine;
        }

        public int getCne() {
            return cne;
        }

        public void setCne(int cne) {
            this.cne = cne;
        }

        public int getNbr_abs() {
            return nbr_abs;
        }

        public void setNbr_abs(int nbr_abs) {
            this.nbr_abs = nbr_abs;
        }
    }

