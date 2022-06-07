
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Hello, world!</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page import="com.example.projetjspgest.Eleve" %>
    <%@ page import="Controller.Gest_student" %>
</head>
<body>

<%! List<Eleve> le;
    Gest_student ge;
%>
<%
    ge=new Gest_student();
    le=ge.Afficher();
%>

<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Groupe</th>
            <th colspan="2" scope="col">Méthode</th>
            <th  scope="col">Absense</th>
        </tr>
        </thead>


        <tbody>
        <%
            Iterator<Eleve> it = le.iterator();
            Eleve e;
            int a=0;
            while (it.hasNext()){
                a++;
                e=it.next();%>

        <tr>
            <td><%=e.getCne()%></td>
            <td><%=e.getNom()%></td>
            <td><%=e.getPrenom()%></td>
            <td><%=e.getGroupe()%></td>
            <td><button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#ze-<%=a%>">Modifier</button></td>
            <td><button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#sup-<%=a%>">Supprimer</button></td>
            <td><a href="./eleveAbs.jsp?id=<%=e.getCne()%>" class="btn btn-outline-dark">Afficher absense</a></td>
            <td> <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#ajoutAB-<%=a%>">Ajouter Absence</button></td>
        </tr>

        <!--Modal de modification-->
        <div class="modal fade" id="ze-<%=a%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modifier Eleve</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="ajouter.jsp">
                            <label for="sem">ID</label>
                            <input type="text" value="<%=e.getCne()%>" id="id" name="id" readonly>

                            <label for="cne">Nom</label>
                            <input type="text" value="<%=e.getNom()%>" id="nom" name="nom" >

                            <label for="nbr">Prénom</label>
                            <input type="text" value="<%=e.getPrenom()%>" id="prenom" name="prenom" >

                            <label for="nbr">Groupe</label>
                            <input type="text" value="<%=e.getGroupe()%>" id="grp" name="grp" >

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" name="action" value="mod">Modifier</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal de suppression-->
        <div id="sup-<%=a%>" class="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Suuprimer un éléve</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Voulez-vous vraiment supprimer l'éléve ayant l'ID <span><%=e.getCne()%></span> ?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <a href="./ajouter.jsp?id=<%=e.getCne()%>&action=supp" type="button" class="btn btn-danger">Save changes</a>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal d'absences-->
        <div class="modal fade" id="ajoutAB-<%=a%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modifier Absence</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="ajouterAB.jsp">
                            <label for="sem">Semaine</label>
                            <input type="text"  id="sem" name="sem" >

                            <label for="cne">CNE</label>
                            <input type="text"  id="cne" name="cne" value="<%=e.getCne()%>" readonly>
                            <label for="nbr">Nombre d'Absence</label>
                            <input type="text"  id="nbr" name="nbr" >

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" name="action" value="ajout">Ajouter Absence</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>

        </tbody>
    </table>
</div>

<center>
    <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#ajouter">Ajouter un éléve</button>
    <a href="index.jsp" class="btn btn-outline-dark">Accéder au Menu</a>
</center>
<!--Modal d'ajout-->
<div class="modal fade" id="ajouter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modifier Eleve</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="ajouter.jsp">
                    <label for="cne">Nom</label>
                    <input type="text" value="" id="nom" name="nom" >

                    <label for="nbr">Prénom</label>
                    <input type="text" value="" id="prenom" name="prenom" >

                    <label for="nbr">Groupe</label>
                    <input type="text" value="" id="grp" name="grp" >

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="action" value="Ajout">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
<style>
    span{
        color: red;
        font-weight: bold;
    }
    th,td{
        text-align: center;
    }
    input[type=text], select {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit] {
        width: 100%;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }



    div {
        border-radius: 5px;

        padding: 20px;
    }
</style>
</html>

