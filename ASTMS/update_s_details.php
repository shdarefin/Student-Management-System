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
    
    $s_id=$_POST['s_id'];
    $s_first_name=$_POST['s_f_n'];
    $s_last_name=$_POST['s_l_n'];
    $s_contract=$_POST['s_contract'];
    $s_a_contract=$_POST['s_a_contract'];
    $s_semester=$_POST['s_semester'];
    $gender=$_POST['gen'];
    $s_bod=$_POST['bod'];
    
    $myquery="UPDATE student_details SET stu_f_name=' $s_first_name',stu_l_name='$s_first_name',stu_contract='$s_contract',stu_another_contract='$s_a_contract',current_semester='$s_semester',gender='$gender',birth_date='s_bod' WHERE stu_id='$s_id'";

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/update_s_details.html");
        echo "\n Inserted";
        
    }
    else{
        echo "ERROR: " . mysqli_error($connection);
    }
}

?>