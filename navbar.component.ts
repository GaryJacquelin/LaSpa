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
      this.usersService.getDeconnexion();
      localStorage.setItem('estConnecter', 'false');
      console.log('nooooooooooo');
      this.router.navigate(['/accueil']);
    } else {
      this.router.navigate(['/connexion']);
    }
  }

  ngOnInit() {
    /* si la varialbe de session n'exister pas encore */
    if (this.antiDebileAngularQuiRetientVariable == 0) {
      localStorage.setItem('estConnecter', 'false');
      this.antiDebileAngularQuiRetientVariable++;
    }
    /* on regarde si il est connecter ou pas  */
    if (localStorage.getItem('estConnecter') == 'true') {
      this.actionAffichage = 'se déconnecter';
    } else {
      this.actionAffichage = 'se connecter';
    }
  }

}
