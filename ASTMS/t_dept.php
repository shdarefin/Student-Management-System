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
    
    $t_id=$_POST['t_id'];
    

    $myquery="INSERT INTO t_department(t_id,t_dept)VALUES('$t_id','$department')";

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/t_dept.html");
        echo "\n Inserted";
        
    }
    else{
        echo "\nNot Inserted";
    }
}

?>