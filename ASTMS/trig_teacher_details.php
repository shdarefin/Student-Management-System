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
    $myquery="SELECT * from teachers_trigger";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Details_id : " . $row["DetailsNo"]. "<br>". "<br>"."<br>"."Teacher Id : ".$row["t_id"]. "<br>"."FirstName : " . $row["t_f_name"]. "<br>"."LastName	 :".$row["t_l_name"] ."<br>"."Student Contract : " . $row["contract"]."<br>"."Additional_contract  : " . $row["a_contract"]. "<br>"."Address  : " . $row["address"]."<br>"."Gender: " . $row["gender"]."<br>"."Sallary: " . $row["sallary"]."<br>"."Time: " . $row["time"]."<br>"."Event: " . $row["Event name"];
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>