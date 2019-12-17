import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class StatutService {

  constructor(private httpClient: HttpClient) {}

  public getListeStatut(): Observable<any> {
    return this.httpClient.get<any>(`${environment.baseURL_Statut}/getListeStatut`);
  }
}
