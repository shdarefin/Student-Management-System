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
    
    $Course_id=$_POST['c_id'];
    $course_name=$_POST['c_name'];
    $course_teacher_id=$_POST['c_t_id'];
    $course_teacher_name=$_POST['c_t_name'];


    
    
    $myquery="INSERT INTO courses(course_id,course_name,course_t_id,course_t_name)VALUES('$Course_id','$course_name','$course_teacher_id','$course_teacher_name')";

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/courses2.html");
        echo "\n Inserted";
        
    }
    else{
        echo "ERROR: " . mysqli_error($connection);
    }
}

?>