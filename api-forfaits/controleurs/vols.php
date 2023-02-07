<?php

require_once './modeles/vols.php';

class ControleurVol {

    /***
     * Fonction permettant de récupérer l'ensemble des forfaits et de les afficher au format JSON
     */
    function afficherJSON() {
        $resultat = modele_vol::ObtenirTous();
        echo json_encode($resultat);
    }
    
    /***
     * Fonction permettant de récupérer un des forfaits et de l'afficher au format JSON
     */
    function afficherFicheJSON($id) {
        $resultat = modele_vol::ObtenirUn($id);
        echo json_encode($resultat);
    }
 

}

?>