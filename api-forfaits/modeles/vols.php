<?php

require_once "./include/config.php";


class modele_vol {
    public $id; 
    public $compagnie_aerienne; 
    public $site_web;
    public $numero_de_vol; 
    public $valises_permises;
    
    /***
     * Fonction permettant de construire un objet de type modele_vol
     */
    public function __construct($id, $compagnie_aerienne, $site_web, $numero_de_vol, $valises_permises) {
        $this->id = $id;
        $this->compagnie_aerienne = $compagnie_aerienne;
        $this->site_web = $site_web;
        $this->numero_de_vol = $numero_de_vol;
        $this->valises_permises = $valises_permises;

    }

    /***
     * Fonction permettant de se connecter à la base de données
     */
    static function connecter() {
        
        $mysqli = new mysqli(Db::$host, Db::$username, Db::$password, Db::$database);

        // Vérifier la connexion
        if ($mysqli -> connect_error) {
            http_response_code(500); // Envoi un code 500 au serveur
            $erreur = new stdClass();
            $erreur->message = "DEBOGAGE : Échec de connexion à la base de données MySQL: ";
            $erreur->error = $mysqli -> connect_error;
            echo json_encode($erreur);
            exit();
        } 

        return $mysqli;
    }

    /***
     * Fonction permettant de récupérer l'ensemble des vols 
     */
    public static function ObtenirTous() {
        $liste = [];
        $mysqli = self::connecter();

        $resultatRequete = $mysqli->query("SELECT * FROM vols ORDER BY id");

        foreach ($resultatRequete as $enregistrement) {
            $liste[] = new modele_vol($enregistrement['id'], $enregistrement['compagnie_aerienne'], $enregistrement['site_web'], $enregistrement['numero_de_vol'], $enregistrement['valises_permises']);
        }

        return $liste;
    }

    /***
     * Fonction permettant de récupérer un vol en fonction de son identifiant
     */
    public static function ObtenirUn($id) {
        $resultat = new stdClass();

        $mysqli = self::connecter();

        if ($requete = $mysqli->prepare("SELECT * FROM vols WHERE id=?")) {  // Création d'une requête préparée 
            $requete->bind_param("i", $id); // Envoi des paramètres à la requête

            $requete->execute(); // Exécution de la requête

            $resultat_requete = $requete->get_result(); // Récupération de résultats de la requête¸
            
            if($enregistrement = $resultat_requete->fetch_assoc()) { // Récupération de l'enregistrement
                $produit = new modele_vol($enregistrement['id'], $enregistrement['compagnie_aerienne'], $enregistrement['site_web'], $enregistrement['numero_de_vol'], $enregistrement['valises_permises']);
            } else {
                http_response_code(404); // Envoi un code 404 au serveur
                $resultat->message = "Erreur: Aucun vol trouvé";
                return $resultat;
            }   
            
            $requete->close(); // Fermeture du traitement
            return $produit; 
        } else {
            http_response_code(500); // Envoi un code 500 au serveur
            $resultat->message = "Une erreur a été détectée dans la requête utilisée : ";
            $resultat->erreur = $mysqli->error;
            return $resultat;
        }        
    }
   
}

?>