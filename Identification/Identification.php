<?php


namespace App\metier;


class Identification
{
    protected $table = 'Identification';
    public $timestamps = false;
    protected $fillable = [
        'codeIDEN',
        'libelleIDEN',
    ];
    public $timetamps = true;
}
