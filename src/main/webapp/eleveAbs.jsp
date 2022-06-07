<%@ page import="java.util.List" %>
<%@ page import="com.example.projetjspgest.Absence" %>
<%@ page import="Controller.Gest_student" %>
<%@ page import="java.util.Iterator" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>



<%! List<Absence> ab;
    Gest_student ge;
%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ge=new Gest_student();
    ab=ge.AfficherAB(id);
    Iterator<Absence> it = ab.iterator();
    Absence a;%>

    <center>
        <div class="container mt-5">
            <table class='table-warning table'>
                <thead>
                <tr class='table-warning'><th class='table-warning'>semaine</th>
                    <th class='table-warning'>Nombre d'absences</th></tr>
                </thead>
                <tbody>
                <%
                    while (it.hasNext()){
                        a=it.next();
                %>
                <tr class='table-warning'>
                    <td class='table-warning'><%=a.getSemaine()%></td>
                    <td class='table-warning'><%=a.getNbr_abs()%></td>
                </tr>
                <%  }
                %>

                </tbody>
            </table>
        </div>
    </center>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>