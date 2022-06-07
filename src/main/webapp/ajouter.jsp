<%@ page import="com.example.projetjspgest.Eleve" %>
<%@ page import="Controller.Gest_student" %>
<%@ page import="java.util.Objects" %>

<%
    Gest_student ge=new Gest_student();

    String action=request.getParameter("action");


    switch (action){
        case "Ajout":
            String nom =request.getParameter("nom");
            String prenom =request.getParameter("prenom");
            int groupe = Integer.parseInt(request.getParameter("grp"));
            ge.Ajoute_etd(new Eleve(nom,prenom,groupe));
            response.sendRedirect("eleve.jsp");
            break;
        case "mod":
            int id = Integer.parseInt(request.getParameter("id"));
            String nom_m =request.getParameter("nom");
            String prenom_m =request.getParameter("prenom");
            int groupe_m = Integer.parseInt(request.getParameter("grp"));
            ge.Modifier_Etd(new Eleve(nom_m,prenom_m,groupe_m),id);
            response.sendRedirect("eleve.jsp");
            ;break;
        case "supp":
            int cne = Integer.parseInt(request.getParameter("id"));
            ge.Supp_etd(cne);
            response.sendRedirect("eleve.jsp");


    }
%>