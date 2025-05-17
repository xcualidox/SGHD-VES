<?php
require_once(__DIR__ . "/../Modelo/m_intervalo.php");

	if (isset($_POST["ope"])) {
		$operacion = $_POST["ope"];


		switch ($operacion) {
			case 'Incluir':
				Registra();
				break;
			
			case 'Borrar':
				Elimina();
				break;
			
			case 'Modificar':
				Modifica();
				break;
			case 'Activar':
					Disponi(1);
					break;
					
			case 'Desactivar':
					Disponi(0);
					break;
		}
		
	}
	
	
function Registra()
{
	$objeto = new intervalo();
	$objeto->setDatos($_POST["nom"],$_POST["horaInicio"],$_POST["horaFinal"]);
	$objeto->incluye();
	header("Location: ../Vista/Intervalo/v_intervalo.php");
	
}

function Modifica()
{

	
	$objeto = new intervalo();
	$objeto->setDatos($_POST["nom"],$_POST["horaInicio"],$_POST["horaFinal"]);
	$objeto->modificar($_POST["origin"]);
	header("Location: ../Vista/Intervalo/v_intervalo.php");
}

function Elimina()
{	
	$objeto = new intervalo();
	$objeto->eliminar($_POST["origin"]);
	header("Location: ../Vista/Intervalo/v_intervalo.php");
}
function Disponi($disponibilidad)  {
	$objeto = new intervalo();
	$objeto->Disponibilidad($disponibilidad,$_POST["nom"]);

	header("Location: ../Vista/Intervalo/v_intervalo.php");
}


?>