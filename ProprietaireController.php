<?php


namespace App\Http\Controllers;


use App\DAO\ServiceAnimal;
use App\DAO\ServiceProprietaire;
use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;

class ProprietaireController
{
    public function ajoutProprietaire() {
        if (Session::get('role') == "admin") {
            try {
                return view('vues/ajouterProprietaire');
            } catch (MonException $e) {
                $erreur = $e->getMessage();
                return view('Error', compact('erreur'));
            } catch (Exception $ex) {
                $erreur = $ex->getMessage();
                return view('Error', compact('erreur'));
            }
        } else {
            $erreur = "Vous n'avez pas l'autorisation d'ajouter";
            return view('Error', compact('erreur'));
        }
    }

    public function postAjoutProprietaire() {
        try {

            $idPRO = Request::input('idPRO');
            $nomPRO = Request::input('nomPRO');
            $prenomPRO = Request::input('prenomPRO');
            $mailPRO = Request::input('mailPRO');
            $adressePRO = Request::input('adressePRO');
            $unProprietaire = new ServiceProprietaire();
            $unProprietaire->ajoutClient($idPRO, $nomPRO, $prenomPRO, $mailPRO,
                $adressePRO,$unProprietaire);
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return view('Error', compact('erreur'));
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            return view('Error', compact('erreur'));
        }
    }
}
