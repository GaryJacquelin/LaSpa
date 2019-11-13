<?php
/**
 * Created by PhpStorm.
 * User: christian
 * Date: 01/10/2019
 * Time: 13:47
 */

namespace App\DAO;

use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;
use  App\Exceptions\MonException;

class ServiceProprietaire
{

    public function ajoutProprietaire($idPRO, $nomPRO,$prenomPRO,$mailPRO,$adressePRO) {
        try {
            DB::table('client')->insert(
                [
                    'idPRO' =>$idPRO,
                    'nomPRO' =>$nomPRO,
                    'prenomPRO' =>$prenomPRO,
                    'mailPRO' =>$mailPRO,
                    'adressePRO' =>$adressePRO]
            );
        } catch (QueryException $e) {
            throw new MonException($e->getMessage());
        }
    }

}
