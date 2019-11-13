<?php

namespace App\metier;
use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;

class Utilisateur extends Model {


    protected $table = 'Utilisateur';
    public $timestamps = false;
    protected $fillable = [
        'idUSER',
        'nomUSER',
        'prenomUSER',
        'adminUSER',
        'identifiantUSER',
        'mdpUSER'
    ];
    public $timetamps = true;
}
?>

