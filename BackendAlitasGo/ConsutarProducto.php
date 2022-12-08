<?php
include 'Conexion.php';

$queryResult=$connect->query("SELECT * FROM producto");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>