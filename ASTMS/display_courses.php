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
    $myquery="SELECT * from courses";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Course Id : " . $row["course_id"]. "<br>". "Course Name : " . $row["course_name"]. "<br>"."Course Teacher Id: ".$row["course_t_id"]. "<br>"."Course Teacher Name  : " . $row["course_t_name"];
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>