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

class ServiceIdentification
{
    public static function getListeIdentifications()
    {
        try {
            $response = DB::table('IDENTIFICATION')
                ->select('*')
                ->get();
            return $response;
        } catch (QueryException $e) {
            throw new MonException($e->getMessage());
        }
    }
}