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
    $myquery="SELECT * from s_login_trigger";

    $result = $connection->query($myquery);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
          
          echo  "<br>"."Details_id : " . $row["DetailsNo"]. "<br>". "<br>"."<br>"."Student UserName: ".$row["s_user_name"]. "<br>"."Password  : " . $row["s_pass"]. "<br>"."reg_date	:".$row["Time"] ."<br>"."Event: " . $row["eventname"]."<br>";
          
        }
    }
    else{
        echo "Data Not Found";
    }

    
    
}
$connection->close();
?>