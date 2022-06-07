<%@ page import="Controller.Gest_student" %>
<%@ page import="com.example.projetjspgest.Absence" %>

<%
    Gest_student ge=new Gest_student();
    int cne= Integer.parseInt(request.getParameter("cne")) ;
    int sem=Integer.parseInt(request.getParameter("sem")) ;
    int nbr=Integer.parseInt(request.getParameter("nbr")) ;
    ge.Ajoute_AB(new Absence(sem,cne,nbr));

    response.sendRedirect("eleve.jsp");

%>