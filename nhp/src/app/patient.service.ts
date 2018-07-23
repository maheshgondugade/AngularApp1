import { Injectable } from '@angular/core';
import {   HttpHeaders, HttpClient, HttpParams } from '@angular/common/http';
import {Observable} from "rxjs/Observable";
import "rxjs/Rx";


//const ROOT_URL:string = "http://localhost:52770/api/Patient";
const ROOT_URL:string = "http://10.11.13.115:8080/api/Patient";

@Injectable({
  providedIn: 'root'
})
export class PatientService {
  
  constructor(private _http: HttpClient) {
   }

   getClaimData(){
      return this._http.get(ROOT_URL+"/GetClaimData");      
   }
   getClinicData(){
      return  this._http.get(ROOT_URL+"/GetClinicData");
   }

   getPatientData(){
    return  this._http.get(ROOT_URL+"/getPatientdata");
  }
}
