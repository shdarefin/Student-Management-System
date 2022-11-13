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
    $s_username=$_POST['login_email'];
    $s_pass=$_POST['userpassword'];
    

    $myquery="INSERT INTO student_login_data(s_user_name,s_pass) VALUES('$s_username','$s_pass')";

    if(mysqli_query($connection,$myquery)){
       header("Location: http://localhost/ASTMS/student.html");
        
    }
    else{
        echo "\nNot Inserted";
    }
}

?>