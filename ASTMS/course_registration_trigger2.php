
<?php
    $host='localhost';
    $username="@'%";
    $password='';
    $dbname = "astms(final_project)";
    $conn=mysqli_connect($host,$username,$password,"$dbname");
    if(!$conn)
        {
          die('Could not Connect MySql Server:' .mysql_error());
        }
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap 4 Bordered Table</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
.bs-example{
margin: 20px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
$('[data-toggle="tooltip"]').tooltip();   
});
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Admin</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <button"><a class="nav-link" href="http://localhost/ASTMS/admin.html">Home <span class="sr-only">(current)</button></span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost/ASTMS/d_i_data.html">Triggers</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="http://localhost/ASTMS/A_f.html">Students Data</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="http://localhost/ASTMS/display_courses2.php">Courses</a>
        </li>
      

        <li class="nav-item">
          <a class="nav-link" href="http://localhost/ASTMS/display_teachers2.php">Teachers</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="http://localhost/ASTMS/d_i_data.html">Details</a>
        </li>
    
      </ul>
      <div class="form-inline my-2 my-lg-0">
        <ul>
          <li class="nav-item">
            <a class="nav-link" href="http://localhost/ASTMS/">Login</a>
          </li>
        </ul>
        
      </div>
    </div>
  </nav>
<div class="bs-example">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="page-header clearfix">
<h2 class="pull-left">Observe registerd students Trigger</h2>
</div>
<?php

$result = mysqli_query($conn,"SELECT * from s_course_registration_trigger");
?>
<?php
if (mysqli_num_rows($result) > 0) {
?>
<table class='table table-bordered table-striped'>
<tr>
<td>DetailsNo</td>
<td>student id</td>
<td>transaction_id</td>
<td>registration date</td>
<td>course_teacher_id</td>
<td>course_teacher_name</td>
<td>course_id</td>
<td>time</td>
<td>Event_details</td>
</tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
<td><?php echo $row["DetailsNo"]; ?></td>
<td><?php echo $row["s_id"]; ?></td>
<td><?php echo $row["transaction_id"]; ?></td>
<td><?php echo $row["reg_date"]; ?></td>
<td><?php echo $row["course_teacher_id"]; ?></td>
<td><?php echo $row["course_teacher_name"]; ?></td>
<td><?php echo $row["course_id"]; ?></td>
<td><?php echo $row["time"]; ?></td>
<td><?php echo $row["Event_details"]; ?></td>


</tr>
<?php
$i++;
}
?>
</table>
<?php
}
else{
echo "No result found";
}
?>
</div>
</div>        
</div>
</div>
</body>
</html>