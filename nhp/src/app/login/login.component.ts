import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';


@Component({
selector: 'app-login',
templateUrl: './login.component.html',
styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
email: string;
password: string;
isValid: boolean;
isLoginError: boolean;

constructor(private router: Router) { }
ngOnInit() {
    
}

onLogin() {
    //     this.userService.userAuthentication(userName,password).subscribe((data : any)=>{
    //      localStorage.setItem('userToken',data.access_token);
    //      this.router.navigate(['/patientinfo']);
    //    },
    //    (err : HttpErrorResponse)=>{
    //      this.isLoginError = true;
    //    });

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
