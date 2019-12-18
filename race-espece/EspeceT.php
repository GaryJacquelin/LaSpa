<?php


namespace App\metier;


class EspeceT implements \JsonSerializable
{

        private $codeES;
        private $libelleES;

        

    public function getCodeES()
    {
        return $this->codeES;
    }

    public function setCodeES($codeES)
    {
        $this->codeES = $codeES;
        return $this;
    }

    public function getLibelleES()
    {
        return $this->libelleES;
    }

    public function setLibelleES($libelleES)
    {
        $this->libelleES = $libelleES;
        return $this;
    }

    public function jsonSerialize()
    {
        return get_object_vars($this);
    }
}
