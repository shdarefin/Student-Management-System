
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
<div class="bs-example">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="page-header clearfix">
<h2 class="pull-left">Teachers List</h2>
</div>
<?php

$result = mysqli_query($conn,"SELECT * from teachers");
?>
<?php
if (mysqli_num_rows($result) > 0) {
?>
<table class='table table-bordered table-striped'>
<tr>
<td>Teacher Id</td>
<td>Teacher First Name</td>
<td>Teacher last name</td>
<td>Contract</td>
<td>Address</td>
<td>Gender</td>
<td>Sallary</td>




</tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
<td><?php echo $row["t_id"]; ?></td>
<td><?php echo $row["t_f_name"]; ?></td>
<td><?php echo $row["t_l_name"]; ?></td>
<td><?php echo $row["contract"]; ?></td>
<td><?php echo $row["address"]; ?></td>
<td><?php echo $row["gender"]; ?></td>
<td><?php echo $row["sallary"]; ?></td>


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
   <form action="admin.html" method="post">  
     
   <input type="submit" type="submit" value="Back to Home Page" class="btn-login"/>
   </form>
<div>
</div>
</div>        
</div>
</div>
</body>
</html>