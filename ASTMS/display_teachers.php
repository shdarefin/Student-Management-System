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
    $myquery="SELECT * from teachers";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Teacher Id : " . $row["t_id"]. "<br>"."<br>". "Teacher First Name : " . $row["t_f_name"]. "<br>"."<br>"."Teacher last name: ".$row["t_l_name"]. "<br>"."<br>"."Contract : " . $row["contract"]."<br>"."<br>"."Address : " . $row["address"]."<br>"."<br>"."Gender : " . $row["gender"]."<br>"."<br>"."Sallary : " . $row["sallary"]."<br>"."<br>";
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>