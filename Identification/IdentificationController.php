<?php

namespace App\Http\Controllers;

use App\dao\ServiceLogin;
use App\Exceptions\MonException;
use App\metier\IdentificationT;
use Illuminate\Support\Facades\Session;
use Request;
use App\DAO\ServiceIdentification;

class IdentificationController extends Controller {

    public function getListeIdentification()
    {
        $listeIdentifications = array();
        try {
            $unIdentification = new ServiceIdentification();
            $response = $unIdentification->getListeIdentifications();
            if ($response) {
                foreach ($response as $value) {
                    $identification = new IdentificationT();
                    $identification->setCodeIDEN((string)$value->CODEIDEN);
                    $identification->setLibelleIDEN((string)$value->LIBELLEIDEN);
                    $listeIdentifications[] = $identification;
                }
            }
            return json_encode($listeIdentifications);
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return response()->json($erreur, 204);
        }
    }

}
