<?php

namespace App\DAO;

use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;

class ServiceEspece
{

    public static function getListeEspece()
    {
        try {
            $response = DB::table('ESPECE')
                ->select('*')
                ->get();
            return $response;
        } catch (QueryException $e) {
            throw new MonException($e->getMessage());
        }
    }

}