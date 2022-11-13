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
    $myquery="SELECT * from student_details_trigger";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Details_id : " . $row["Details"]. "<br>". "<br>"."<br>"."Student Id : ".$row["stu_id"]. "<br>"."FirstName : " . $row["stu_f_name"]. "<br>"."LastName	 :".$row["stu_l_name"] ."<br>"."Student Contract : " . $row["stu_contract"]."<br>"."Semester  : " . $row["current_semester"]. "<br>"."Gender  : " . $row["gender"]."<br>"."Birth Date: " . $row["birth_date"]."<br>"."Time: " . $row["time"]."<br>"."Event_details: " . $row["Event_details"];
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>