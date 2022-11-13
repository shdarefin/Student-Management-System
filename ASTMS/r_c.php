<?php
echo " <h1>Insert Data into Database</h1>";

$servername = "localhost";
$username =  "@'%";
$password = "";
$dbname = "astms(final_project)";

$connection= new mysqli($servername,$username,$password,$dbname);

if($connection==false){
    die("Connection Failed".mysqli_connect_error());
}
else{
   
    $reg_id=$_POST['student_id'];
    //$stu_id = 3725

    $myquery="CALL get_reg_course_id($reg_id)";


   // $stmt = $connection->prepare($myquery);
    //$stmt->bindParam(":reg_id", $reg_id);
    //$stmt->execute();
    if($result = mysqli_query($connection,$myquery)){
        while($row = mysqli_fetch_row($result)){

             echo  "<br>"."Student Id : " . $reg_id. "<br>". "Course Id: " . $row[0]. "<br>";
        
        }
    }

   // $stu_id = $stmt->fetchAll(PDO::FETCH_ASSOC);
   // print_r($stu_id);
   // exit;

    
}
$connection->close();
?>


