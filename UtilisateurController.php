<?php

namespace App\Http\Controllers;

use App\DAO\ServiceProprietaire;
use App\Exceptions\MonException;
use Illuminate\Support\Facades\Session;
use Request;
use App\DAO\ServiceUtilisateur;

class UtilisateurController extends Controller {

    /**
     * Authentifie le visiteur
     * @return type Vue formLogin ou home
     */
    public function signIn() {
        try {
            $login = Request::input('login');
            $pwd = Request::input('pwd');
            $unUtilisateur = new ServiceUtilisateur();
            $connected = $unUtilisateur->login($login, $pwd);
            if ($connected) {
                return view('home');
            } else {
                $erreur = "Login ou mot de passe inconnu !";
                return view('Error', compact('erreur'));
            }
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return view('Error', compact('erreur'));
        }
    }

    /**
     * Déconnecte le visiteur authentifié
     * @return type Vue home
     */
    public function signOut() {
        try {

            $unUtilisateur = new ServiceUtilisateur();
            $unUtilisateur->logout();
            return view('home');
        } catch (Exception $e) {
            $erreur = $e->getMessage();
            return view('Error', compact('erreur'));
        }
    }

    /**
     * Initialise le formulaire d'authentification
     * @return type Vue formLogin
     */
    public function getLogin() {
        try {
            $erreur = "";
            return view('formLogin', compact('erreur'));
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            return view('Error', compact('erreur'));
        }
    }
    public function ajoutUtilisateur() {
        if (Session::get('role') == "admin") {
            try {
                return view('vues/ajouterUtilisateur');
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

    public function postAjoutUtilisateur() {
        try {

            $idUSER = Request::input('idUSER');
            $nomUSER = Request::input('nomUSER');
            $prenomUSER = Request::input('prenomUSER');
            $adminUSER = Request::input('adminUSER');
            $identifiantUSER = Request::input('identifiantUSER');
            $mdpUSER = Request::input('mdpUSER');
            $unUtilisateur = new ServiceProprietaire();
            $unUtilisateur->ajoutClient($idUSER, $nomUSER, $prenomUSER, $adminUSER,
                $identifiantUSER,$mdpUSER);
        } catch (MonException $e) {
            $erreur = $e->getMessage();
            return view('Error', compact('erreur'));
        } catch (Exception $ex) {
            $erreur = $ex->getMessage();
            return view('Error', compact('erreur'));
        }
    }

}
