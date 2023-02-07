<?php
	header('Content-Type: application/json;'); 
	header('Access-Control-Allow-Origin: *'); 
    require_once './controleurs/vols.php';
    $controllerVol=new ControleurVol;

	switch($_SERVER['REQUEST_METHOD']) { 
		case 'GET': // GESTION DES DEMANDES DE TYPE GET 
			if(isset($_GET['id'])) { 
				// CODE PERMETTANT DE RÉCUPÉRER L'ENREGISTREMENT CORRESPONDANT À L'IDENTIFIANT PASSÉ EN PARAMÈTRE 
                $controllerVol->afficherFicheJSON($_GET['id']);
			} else { 
				// CODE PERMETTANT DE RÉCUPÉRER TOUT LES ENREGISTREMENTS 
                $controllerVol->afficherJSON();
			} 
			break; 
		default: 
} 
?>