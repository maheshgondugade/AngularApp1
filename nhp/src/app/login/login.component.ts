import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
selector: 'app-login',
templateUrl: './login.component.html',
styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
email: string;
password: string;
isValid: boolean;

constructor(private router: Router) { }
ngOnInit() {
    
}

onLogin() {
    if(this.email=="admin" && this.password =="admin")
    {
        this.router.navigateByUrl('patientinfo');
    }
    else{
        this.router.navigateByUrl('');
        this.isValid = false; 
    }
}

}
