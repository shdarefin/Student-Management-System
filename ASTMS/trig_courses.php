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
    $myquery="SELECT * from courses_trigger";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Details_id : " . $row["Details_id"]. "<br>". "<br>"."<br>"."course_name: ".$row["course_name"]. "<br>"."<br>"."course_t_id  : " . $row["course_t_id"]. "<br>"."<br>"."course_t_name	 : " . $row["course_t_name"]. "<br>"."<br>"."time  : " . $row["time"]. "<br>"."<br>"."Event_details  : " . $row["Event_details"];
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>