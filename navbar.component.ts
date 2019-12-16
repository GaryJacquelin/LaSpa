import { Component, OnInit } from '@angular/core';
import { UsersService} from "../service/users.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {

  private actionURL: string;
  private actionAffichage: string;
  private antiDebileAngularQuiRetientVariable = 0;

  constructor(private router: Router, private usersService: UsersService) { }


  action() {

    /* on regarde si il est connecter ou pas  */
    if (localStorage.getItem('estConnecter')) {
      /* s'il est connecté on le déconnecte */
      this.usersService.getDeconnexion();
      localStorage.setItem('estConnecter', 'false');
      this.router.navigate(['/accueil']);
    } else {
      /* s'il n'est pas connecté on l'envoie vers la page de connexion */
      this.router.navigate(['/connexion']);
    }
  }

  ngOnInit() {
    /* pour instancier la variable de session quand on démarre le site */
    if (this.antiDebileAngularQuiRetientVariable == 0) {
      localStorage.setItem('estConnecter', 'false');
      this.antiDebileAngularQuiRetientVariable++;
    }
    /* on regarde si il est connecter ou pas  */
    if (localStorage.getItem('estConnecter') == 'true') {
      /* si est connecté il peu se déconnecter */
      this.actionAffichage = 'se déconnecter';
    } else {
      /* sinon on le propose de se connecter */
      this.actionAffichage = 'se connecter';
    }
  }

}
