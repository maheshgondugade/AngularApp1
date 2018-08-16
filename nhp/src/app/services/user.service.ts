import { Injectable } from '@angular/core';
import {  HttpClient ,HttpHeaders } from '@angular/common/http';

const ROOT_URL:string = "http://10.11.13.115:8080/api/Patient";
@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http : HttpClient) { }


  /*
  userAuthentication(userName, password) {
    var data = "username=" + userName + "&password=" + password + "&grant_type=password";
    var reqHeader = new HttpHeaders({ 'Content-Type': 'application/x-www-urlencoded','No-Auth':'True' });
    return this.http.post(ROOT_URL + '/token', data, { headers: reqHeader });
  }
  */

}
