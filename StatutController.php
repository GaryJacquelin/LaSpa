<?php

namespace App\Http\Controllers;

use App\dao\ServiceLogin;
use App\Exceptions\MonException;
use App\metier\StatutT;
use Illuminate\Support\Facades\Session;
use Request;
use App\DAO\ServiceStatut;

class StatutController extends Controller {

    public function getListeStatut()
    {
        $listeStatut = array();
        try {
            $unStatut = new ServiceStatut();
            $response = $unStatut->getListeStatut();
            if ($response) {
                foreach ($response as $value) {
                    $Statut = new StatutT();
                    $Statut->setCodeSTA((string)$value->CODESTA);
                    $Statut->setLibelleSTA((string)$value->LIBELLESTA);
                    $listeStatut[] = $Statut;
                }
            }
            return json_encode($listeStatut);
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return response()->json($erreur, 204);
        }
    }

}
