import { Component, OnInit } from '@angular/core';
import { AnimalService } from 'src/app/service/animal.service';
import {Animal} from "../metier/animal";
import {Statut} from "../metier/statut";
import { StatutService } from 'src/app/service/statut.service';

@Component({
  selector: 'app-back-office',
  templateUrl: './back-office.component.html',
  styleUrls: ['./back-office.component.css']
})
export class BackOfficeComponent implements OnInit {

  public lesAnimaux: Animal[];
  public lesStatuts: Statut[];

  constructor(private animalService: AnimalService, private statutService: StatutService) {}

  ngOnInit() {

    this.animalService.getListeAnimaux().subscribe(

      (data) => {

        this.lesAnimaux = data;

      }, err => {

      }
    );

    this.statutService.getListeStatut().subscribe(

      (data) => {

        this.lesStatuts = data;

      }, err => {

      }
    );

  }

}
