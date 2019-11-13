<?php
/**
 * Created by PhpStorm.
 * User: christian
 * Date: 01/10/2019
 * Time: 13:46
 */

namespace App\DAO;

use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;

class ServiceAnimal
{

    public function ajoutAnimal($idAnimal, $CodeIDEN,$CodeSTA,$nomAnimal,$dateArriveAnimal,$dateDepartAnimal,$description,$Sexe,$castre,$age,$vacciner,$image,$prixAdoption) {
        try {
            DB::table('Animal')->insert(
                [
                    'idAnimal' =>$idAnimal,
                    'CodeIDEN' =>$CodeIDEN,
                    'CodeSTA' =>$CodeSTA,
                    'nomAnimal' =>$nomAnimal,
                    'dateArriveAnimal' =>$dateArriveAnimal,
                    'dateDepartAnimal' =>$dateDepartAnimal,
                    'description' =>$description,
                    'Sexe' =>$Sexe,
                    'castre' =>$castre,
                    'age' =>$age,
                    'vacciner' =>$vacciner,
                    'image' =>$image,
                    'prixAdoption' =>$prixAdoption
                ]
            );
        } catch (QueryException $e) {
            throw new MonException($e->getMessage());
        }
    }


}
