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
    echo"Connection Successful";
    
    $s_id=$_POST['t_id'];
   

    $myquery="DELETE FROM `s_course_registration` WHERE course_teacher_id = '$s_id'";

    //DELETE FROM student_details WHERE stu_id = 0;

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/d_s_info.html");
        echo "\n Inserted";
        
    }
    else{
        echo "ERROR: " . mysqli_error($connection);
    }
}

?>