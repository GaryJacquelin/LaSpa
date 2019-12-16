<?php


namespace App\metier;


class StatutT implements \JsonSerializable
{

        private $codeSTA;
        private $libelleSTA;

        

    public function getCodeSTA()
    {
        return $this->codeSTA;
    }

    public function setCodeSTA($codeSTA)
    {
        $this->codeSTA = $codeSTA;
        return $this;
    }

    public function getLibelleSTA()
    {
        return $this->libelleSTA;
    }

    public function setLibelleSTA($libelleSTA)
    {
        $this->libelleSTA = $libelleSTA;
        return $this;
    }

    public function jsonSerialize()
    {
        return get_object_vars($this);
    }
}
