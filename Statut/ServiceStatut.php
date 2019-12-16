<?php

namespace App\DAO;

use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;

class ServiceStatut
{

    public static function getListeStatut()
    {
        try {
            $response = DB::table('STATUT')
                ->select('*')
                ->get();
            return $response;
        } catch (QueryException $e) {
            throw new MonException($e->getMessage());
        }
    }

}