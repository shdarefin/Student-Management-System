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
    $admin_username=$_POST['loginemail'];
    $admin_pass=$_POST['loginpasword'];
    

    //$myquery="INSERT INTO admin_login_data(email,admin_pass) VALUES('$admin_username',' $admin_pass')";

    if($admin_username === "Rahat1369@gmail.com" && $admin_pass === 
    "1234"){
       header("Location: http://localhost/ASTMS/admin.html");
        
    }
    else{
        echo "\nNot Inserted";
    }
}

?>