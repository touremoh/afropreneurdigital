import {Injectable} from '@angular/core';
import {User} from '../model/User';
import {Observable, Subject} from 'rxjs';
import {HttpClient} from '@angular/common/http';
import {ResponseEntity} from '../model/ResponseEntity';
import {AppServices} from './AppServices';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationServices {
  private admin: User;
  private authServiceMessage = new Subject<any>();
  private loggedIn = false;
  private BASE_URL = 'http://localhost:8080/api/v1/authors/';

  constructor(private http: HttpClient, private appServices: AppServices) {}

  login(login: string, password: string): Observable<ResponseEntity> {
    return this.http.get<ResponseEntity>(this.BASE_URL + login + '/' + password);
  }

  getAdmin(): User {
    return this.admin;
  }

  setAdmin(newAdmin: User) {
    this.admin = newAdmin;
  }

  switchToAdminConsole(canSwitch: boolean) {
    this.authServiceMessage.next(canSwitch);
  }

  getAuthServiceMessage(): Observable<any> {
    return this.authServiceMessage.asObservable();
  }

  connected(): boolean {
    return this.loggedIn;
  }

  setLoggedIn(logged: boolean) {
    this.loggedIn = logged;
  }

  disconnect() {
    this.loggedIn = false;
    this.admin = null;
    this.appServices.disableAdminConsole();
  }
}
