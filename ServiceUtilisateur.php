<?php
/**
 * Created by PhpStorm.
 * User: christian
 * Date: 01/10/2019
 * Time: 13:47
 */

namespace App\DAO;

use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;

class ServiceUtilisateur
{

    public function ajoutUtilisateur($idUSER, $nomUSER,$prenomUSER,$adminUSER,$identifiantUSER,$mdpUSER) {
        try {
            DB::table('Utilisateur')->insert(
                [
                    'idUSER' =>$idUSER,
                    'nomUSER' =>$nomUSER,
                    'prenomUSER' =>$prenomUSER,
                    'adminUSER' =>$adminUSER,
                    'identifiantUSER' =>$identifiantUSER,
                    'mdpUSER' =>$mdpUSER]
            );
        } catch (QueryException $e) {
            throw new MonException($e->getMessage());
        }
    }
}
