<?php


namespace App\metier;


class Statut
{
    protected $table = 'Statut';
    public $timestamps = false;
    protected $fillable = [
        'CodeSTA',
        'libelleSTA',
    ];
    public $timetamps = true;
}
