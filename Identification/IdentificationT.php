<?php


namespace App\metier;

use Illuminate\Support\Facades\Session;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use DB;

class IdentificationT implements \JsonSerializable {
    private $codeIDEN;
    private $libelleIDEN;

    
    public function getCodeIDEN()
    {
        return $this->codeIDEN;
    }

    public function setCodeIDEN($codeIDEN)
    {
        $this->codeIDEN = $codeIDEN;
        return $this;
    }

    
    public function getLibelleIDEN()
    {
        return $this->libelleIDEN;
    }

    public function setLibelleIDEN($libelleIDEN)
    {
        $this->libelleIDEN = $libelleIDEN;
        return $this;
    }

    
    public function jsonSerialize()
    {
        return get_object_vars($this);
    }
}