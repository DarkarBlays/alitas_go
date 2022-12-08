<?php

	include 'Conexion.php';

	$Nombre = $_POST['Nombre'];
	$Precio = $_POST['Precio'];
	$Descripcion = $_POST['Descripcion'];
	$Cantidad = $_POST['Cantidad'];
	$Acompanamiento = $_POST['Acompanamiento'];


	$connect->query("INSERT INTO producto (Nombre, Precio, Descripcion, Cantidad, Acompanamiento) VALUES ('".$Nombre."','".$Precio."','".$Descripcion."','".$Cantidad."','".$Acompanamiento."')")
?>