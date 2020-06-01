import {Injectable} from '@angular/core';
import * as fromUsers from './user.json';
import {User} from '../model/User';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationServices {
  admin: User;
  result = {ok: false, code: '', message: ''};

  login(login: string, password: string): {ok: boolean, code: string, message: string} {
    const user = this.findUser();

    if (user.login !== login) {
      this.result = {
        ok: false,
        code: 'INCORRECT_LOGIN',
        message: 'Login incorrect. Veuillez réssayer'
      };
    } else if (user.password !== password) {
      this.result = {
        ok: false,
        code: 'INCORRECT_PASSWORD',
        message: 'Mot de passe incorrect. Veuillez réssayer'
      };
    } else {
      this.result = {
        ok: true,
        code: 'CONNECTION_SUCCEED',
        message: 'Connexion réussie !'
      };
    }
    return this.result;
  }

  findUser(): User {
    if (this.admin === undefined || this.admin === null) {
      this.admin = fromUsers[Object.keys(fromUsers).shift()].shift() as User;
    }
    return this.admin;
  }
}
