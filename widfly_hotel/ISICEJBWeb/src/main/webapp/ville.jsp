<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-ay2eApsZbY/uVKLr+Z8TO0JB58dRr5qV+zl2TpYY7ZlUV2HVGpr0/2W1uPg3LsR8SvMf8ViFA9OqnU5Lqj7U3ow==" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <!-- Your existing head content here -->
    
    <meta charset="UTF-8">
    <title>Filières List</title>
  <style>
        body {
            background-color: #f0f8ff;
            color: #333;
            font-family: 'Arial', sans-serif;
            margin: 20px;
        }

        .container {
            margin-top: 20px;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .data-table th,
        .data-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .data-table th {
            background-color: #87ceeb;
            color: #fff;
        }

        .data-table tr:hover {
            background-color: #e0f8ff;
        }

        .data-table tbody tr:nth-child(even) {
            background-color: #f0f0f0;
        }

        .data-table tbody tr:nth-child(odd) {
            background-color: #fff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: bold;
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .select-filter {
            flex-grow: 1;
            margin-right: 10px;
        }

        .btn {
            padding: 8px 16px;
            margin: 5px;
            cursor: pointer;
        }

 .btn-danger {
            background-color: #ff799f;
            color: #fff;
        }
        .btn-primary {
            background-color: #87ceeb;
            color: #fff;
        }
    </style>
</head>
<body>


<div class="container">
      <div >
            <div >
                <h1 class="display-4">Cities List</h1>



                <!-- Navigation Links to the Right -->
             
               </div></div></div>
             <br>
    <a href="http://localhost:8080/ISICEJBWeb/HotelController" class="text-primary" style="text-decoration: none; display: flex; align-items: center; transition: all 0.3s;">
       <button style="background: url('https://www.vhv.rs/dpng/d/512-5121858_return-button-clipart-back-button-png-icon-transparent.png') no-repeat center center / contain; width: 30px; height: 30px; border: none; cursor: pointer; opacity: 0.7; transition: opacity 0.3s ease;" onclick="history.go(-1);"></button>
          <br> 
        <span style="font-size: 18px; margin-left: 8px;"> Hotels Management </span>
    </a>

    


            </div>

        </div>


        <!-- Add ville Modal -->
        <div class="modal fade" id="villeModalCenter" tabindex="-1" role="dialog" aria-labelledby="villeModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="villeModalCenterTitle">Add City</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                      
                            <label class="custom-modal-label" for="Name">Name</label>
                            <input type="text" name="nom" class="form-control" required><br><br>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer">
                        </div>
                    </div>
                </form>
            </div>
        </div>

  <div class="modal fade" id="ModifyvilleModal" tabindex="-1" role="dialog" aria-labelledby="ModifyvilleModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyvilleModalTitle">Modify City</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                          
                            <label class="custom-modal-label" for="Name">Name</label>
                            <input type="text" name="nom" class="form-control" id="modalvilleName" required><br><br>

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalvilleId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer">
                        </div>
                    </div>
                </form>
            </div>
        </div>

 <!--  voir tous les villes-->
  <table class="table data-table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                  
                    <th>Name</th>
                    <th>Delete</th>
                     <th>Modify</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${villes}" var="ville">
                    <tr>
                        <td>${ville.id}</td>
                     
                        <td>${ville.nom}</td>
                        <td>
                            <form action="VilleController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${ville.id}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                             </td>
                              <td >
                           <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#ModifyvilleModal" data-ville-id="${ville.id}" data-ville-name="${ville.nom}">
    Modifier
</button>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
             <div class="text-center">
          <a href="" ></a>
               
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#villeModalCenter">
               Add City
            </button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $('#ModifyvilleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var villeId = button.data('ville-id');          
            var villeName = button.data('ville-name');
            var modal = $(this);
            modal.find('#modalvilleName').val(villeName);          
            modal.find('#modalvilleId').val(villeId);
        });
    </script>


</body>
</html>