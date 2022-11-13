<?php
echo " <h1>Not registered student name</h1>";

$servername = "localhost";
$username =  "@'%";
$password = "";
$dbname = "astms(final_project)";

$connection= new mysqli($servername,$username,$password,$dbname);

if($connection==false){
    die("Connection Failed".mysqli_connect_error());
}
else{
    $myquery="select DISTINCT student_details.stu_f_name,student_details.stu_l_name from student_details left JOIN  s_course_registration on student_details.stu_id = s_course_registration.s_id where (s_course_registration.s_id is null)";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Student First Name : " . $row["stu_f_name"]. "<br>". "Student Last Name : " . $row["stu_l_name"]. "<br>";
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>