<?php


namespace App\metier;


class Race
{
    protected $table = 'Race';
    public $timestamps = false;
    protected $fillable = [
        'codeRACE',
        'codeES',
        'libelleRACE',
    ];
    public $timetamps = true;
}
