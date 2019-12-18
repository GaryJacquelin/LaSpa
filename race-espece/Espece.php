<?php


namespace App\metier;


class Espece
{
    protected $table = 'Espece';
    public $timestamps = false;
    protected $fillable = [
        'codeES',
        'libelleES',
    ];
    public $timetamps = true;
}
