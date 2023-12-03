<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-ay2eApsZbY/uVKLr+Z8TO0JB58dRr5qV+zl2TpYY7ZlUV2HVGpr0/2W1uPg3LsR8SvMf8ViFA9OqnU5Lqj7U3ow==" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <title></title>
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
                  <h1 class="display-4">Hotel List</h1>
          
          </div> <br>
          </div></div>

                <!-- Navigation Links to the Right -->
             <div >
               </div></div>
             <br>
    <a href="http://localhost:8080/ISICEJBWeb/VilleController" class="text-primary" style="text-decoration: none; display: flex; align-items: center; transition: all 0.3s;">
       <button style="background: url('https://www.vhv.rs/dpng/d/512-5121858_return-button-clipart-back-button-png-icon-transparent.png') no-repeat center center / contain; width: 30px; height: 30px; border: none; cursor: pointer; opacity: 0.7; transition: opacity 0.3s ease;" onclick="history.go(-1);"></button>
          <br> 
        <span style="font-size: 18px; margin-left: 8px;"> Cities Management </span>
    </a>

    <br>
</div>
      </div>
    </div>

<form action="HotelController" method="post" class="mb-4">
    <div >
       
        <div>
            <select name="filterVille" class="form-control">
                <option value="0">All Hotels</option>
                <c:forEach items="${villes}" var="ville">
                    <option value="${ville.id}">${ville.nom}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="action" value="filterByVille">
            <button type="submit" class="btn btn-primary">Filter</button>
        </div>
    </div>
</form>

      
        
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Add Hotel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="adresse">Adress</label>
                            <input type="text" name="adresse" class="form-control" required><br><br>

                        
                            <label class="custom-modal-label" for="nom">Name</label>
                            <input type="text" name="nom" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="telephone">Phone</label>
                            <input type="text" name="telephone" class="form-control" required><br><br>

                            <label class="custom-modal-label" for="ville">City</label>
                            <select name="ville" class="form-control" required>
                                <c:forEach items="${villes}" var="ville">
                                    <option value="${ville.id}">${ville.nom}</option>
                                </c:forEach>
                            </select>
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Save">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="modal fade" id="ModifyStudentModal" tabindex="-1" role="dialog" aria-labelledby="ModifyStudentModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyStudentModalTitle">Modify Hotel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="adresse">Adress</label>
                            <input type="text" name="adresse" class="form-control" id="modalStudentadresse" required><br><br>

                            <label class="custom-modal-label" for="nom">Name</label>
                            <input type="text" name="nom" class="form-control" id="modalStudentnom" required><br><br>

                            <label class="custom-modal-label" for="telephone">Phone</label>
                            <input type="text" name="telephone" class="form-control" id="modalStudentTelephone" required><br><br>

                            <label class="custom-modal-label" for="ville">City</label>
                            <select name="ville" class="form-control" id="modalStudentville" required>
                                <c:forEach items="${villes}" var="ville">
                                    <option value="${ville.id}">${ville.nom}</option>
                                </c:forEach>
                            </select>

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalStudentId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Save Changes">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        
<!--  <div class="modal fade" id="AssignVilleModal" tabindex="-1" role="dialog" aria-labelledby="AssignRoleModalTitle" aria-hidden="true"> -->
<!--             <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!--                 <form action="EtudiantController" method="post"> -->
<!--                     <div class="modal-content"> -->
<!--                         <div class="modal-header"> -->
<!--                             <h5 class="modal-title" id="AssignRoleModalTitle">affectation de Restaurent a une Ville</h5> -->
<!--                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                                 <span aria-hidden="true">&times;</span> -->
<!--                             </button> -->
<!--                         </div> -->
<!--                         <div class="modal-body"> -->
<!--                             <label class="custom-modal-label" for="role">Choisir une ville:</label> -->
<!--                             <select name="role" class="form-control" required> -->
<%--                                 <c:forEach items="${villes}" var="ville"> --%>
<%--                                     <option value="${ville.id}">${ville.nom}</option> --%>
<%--                                 </c:forEach> --%>
<!--                             </select> -->

<!--                             <input type="hidden" name="action" value="addVille"> -->
<!--                             <input type="hidden" name="id" id="modalStudentId"> -->
<!--                             <input type="hidden" name="villeId" id="modalAssignVilleId"> -->
<!--                         </div> -->
<!--                         <div class="modal-footer"> -->
<!--                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--                             <input type="submit" class="btn btn-primary" value="Affectation ville"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
       <table class="table data-table">
    <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Adress</th>
            <th>Name</th>
            <th>Phone</th>
            <th>City</th>
            <th>Delete</th>
            <th>Modify</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${hotels}" var="hotel">
            <tr>
                <td>${hotel.id}</td>
                <td>${hotel.adresse}</td>
                <td>${hotel.nom}</td>
                <td>${hotel.telephone}</td>
                <td>${hotel.ville.nom}</td>
                <td>
                    <form action="HotelController" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${hotel.id}">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </td>
                <td>
                    <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#ModifyStudentModal"
                            data-student-id="${hotel.id}" data-student-adresse="${hotel.adresse}"
                             data-student-nom="${hotel.nom}"
                            data-student-telephone="${hotel.telephone}" data-student-ville="${hotel.ville}">
                        Modifier
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
        <div class="text-center">
         <a href="" ></a>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
               Add Hotel
            </button>
    </div>
  </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $('#ModifyStudentModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var studentId = button.data('student-id');
            var studentadresse = button.data('student-adresse');


            var studentnom = button.data('student-nom');
            var studentTelephone = button.data('student-telephone');
            var studentville = button.data('student-ville');
            var modal = $(this);

            modal.find('#modalStudentadresse').val(studentadresse);
          
            modal.find('#modalStudentnom').val(studentnom);
            modal.find('#modalStudentTelephone').val(studentTelephone);
            modal.find('#modalStudentville').val(studentville);
            modal.find('#modalStudentId').val(studentId);
        });

        $('#AssignVilleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var villetId = button.data('ville-id');
            var modal = $(this);

            modal.find('#modalAssignVilleId').val(villetId);
        });
 </script>
</body>
</html>
