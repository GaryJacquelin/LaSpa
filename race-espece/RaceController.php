<?php

namespace App\Http\Controllers;

use App\Exceptions\MonException;
use App\metier\RaceT;
use Illuminate\Support\Facades\Session;
use Request;
use App\DAO\ServiceRace;

class RaceController extends Controller {

    public function getListeRace()
    {
        $listeRace = array();
        try {
            $uneRace = new ServiceRace();
            $response = $uneRace->getListeRace();
            if ($response) {
                foreach ($response as $value) {
                    $Race = new RaceT();
                    $Race->setCodeRACE((string)$value->CODERACE);
                    $Race->setCodeES((string)$value->CODEES);
                    $Race->setLibelleRACE((string)$value->LIBELLERACE);
                    $listeRace[] = $Race;
                }
            }
            return json_encode($listeRace);
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return response()->json($erreur, 204);
        }
    }

}
