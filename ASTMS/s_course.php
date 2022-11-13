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
    
    $stu_id=$_POST['s_id'];
    $transaction_id=$_POST['tran_id'];
    $date=$_POST['date'];
    $course_teacher_id=$_POST['c_t_id'];
    $course_teacher_name=$_POST['c_t_name'];
    $course_id=$_POST['course_id'];
  
    $myquery="INSERT INTO s_course_registration(s_id,transaction_id,reg_date,course_teacher_id,course_teacher_name,course_id)VALUES('$stu_id','$transaction_id','$date','$course_teacher_id','$course_teacher_name','$course_id')";

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/s_course2.html");
        echo "\n Inserted";
        
    }
    else{
        echo "ERROR: " . mysqli_error($connection);
    }
}

?>