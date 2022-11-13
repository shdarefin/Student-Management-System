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
    $t_first_name=$_POST['t_f_n'];
    $t_last_name=$_POST['t_l_n'];
    $t_contract=$_POST['t_contract'];
    $t_a_contract=$_POST['t_a_contract'];
    $address=$_POST['address'];
    $gender=$_POST['gen'];
    $Salary=$_POST['sl'];

    $myquery="INSERT INTO teachers(t_id,t_f_name,t_l_name,contract,a_contract,address,gender,sallary) VALUES('$t_id','$t_first_name','$t_last_name','$t_contract','$t_a_contract','$address','$gender','$Salary')";

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/teachers2.html");
        echo "\n Inserted";
        
    }
    else{
        echo "ERROR: " . mysqli_error($connection);
    }
}

?>