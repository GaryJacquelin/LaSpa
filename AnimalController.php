<?php


namespace App\Http\Controllers;


use App\DAO\ServiceAnimal;
use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;

class AnimalController
{
    public function ajoutAnimal() {
        if (Session::get('role') == "admin") {
            try {
                return view('vues/ajouterAnimal');
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
            $idAnimal = Request::input('idAnimal');
            $CodeIDEN = Request::input('CodeIDEN');
            $CodeSTA = Request::input('CodeSTA');
            $nomAnimal = Request::input('nomAnimal');
            $dateArriveAnimal = Request::input('dateArriveAnimal');
            $dateDepartAnimal = Request::input('dateDepartAnimal');
            $description = Request::input('description');
            $Sexe = Request::input('Sexe');
            $castre = Request::input('castre');
            $age = Request::input('age');
            $vacciner = Request::input('vacciner');
            $image = Request::input('image');
            $prixAdoption = Request::input('prixAdoption');
            $unAnimal = new ServiceAnimal();
            $unAnimal->ajoutClient($idAnimal, $CodeIDEN, $CodeSTA, $nomAnimal,
                $dateArriveAnimal,$dateDepartAnimal,$description,$Sexe,$castre,$age,
                $vacciner,$image,$prixAdoption);
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return view('Error', compact('erreur'));
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            return view('Error', compact('erreur'));
        }
    }
}
