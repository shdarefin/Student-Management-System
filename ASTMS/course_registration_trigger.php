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
    $myquery="SELECT * from s_course_registration_trigger";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Details_id : " . $row["DetailsNo"]. "<br>". "<br>"."<br>"."s_id: ".$row["s_id"]. "<br>"."transaction_id  : " . $row["transaction_id"]. "<br>"."reg_date	 :".$row["reg_date"] ."<br>"."course_id: " . $row["course_id"]."<br>"."course_teacher_id  : " . $row["course_teacher_id"]. "<br>"."Time : " . $row["time"]."<br>"."Event_details: " . $row["Event_details"];
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>