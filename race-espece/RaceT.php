<?php


namespace App\metier;


class RaceT implements \JsonSerializable
{

        private $codeRACE;
        private $codeES;
        private $libelleRACE;

        

    public function getCodeRACE()
    {
        return $this->codeRACE;
    }

    public function setCodeRACE($codeRACE)
    {
        $this->codeRACE = $codeRACE;
        return $this;
    }


    public function getCodeES()
    {
        return $this->codeES;
    }

    public function setCodeES($codeES)
    {
        $this->codeES = $codeES;
        return $this;
    }


    public function getLibelleRACE()
    {
        return $this->libelleRACE;
    }

    public function setLibelleRACE($libelleRACE)
    {
        $this->libelleRACE = $libelleRACE;
        return $this;
    }


    public function jsonSerialize()
    {
        return get_object_vars($this);
    }
}
