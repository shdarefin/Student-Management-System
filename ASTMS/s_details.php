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
    
    $stu_id=$_POST['s_id'];
    $stu_f_name=$_POST['s_f_n'];
    $stu_l_name=$_POST['s_l_n'];
    $stu_contract=$_POST['s_contract'];
    $stu_another_contract=$_POST['s_a_contract'];
    $current_semester=$_POST['s_semester'];
    $gender=$_POST['gen'];
    $birth_date=$_POST['bod'];

    //$myquery="INSERT INTO student_details(stu_id,stu_f_name,stu_l_name,stu_contract,stu_another_contract,current_semester,gender,birth_date) VALUES('$s_id','$s_first_name','$s_last_name','$s_contract','$s_a_contract','$s_semester','$gender','$s_bod')";

    $myquery = "CALL add_data_stu_table('$stu_id','$stu_f_name','$stu_l_name','$stu_contract','$stu_another_contract','$current_semester','$gender','$birth_date')";

    if(mysqli_query($connection,$myquery)){
        header("Location: http://localhost/ASTMS/s_details2.html");
        echo "\n Inserted";
        
    }
    else{
        echo "ERROR: " . mysqli_error($connection);
    }
}
$connection->close();
?>