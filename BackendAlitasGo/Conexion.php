<?php
   header('Access-Control-Allow-Origin: *');
   header('Access-Control-Allow-Credentials: true');
   header('content-type: application/json; charset=utf-8');
   header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
   header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');

$connect = new mysqli("localhost","root","","bd_alitas_go");

if($connect){
	 
}else{
	echo "Algo ha fallado, revise la conexión";
	exit();
}
?>