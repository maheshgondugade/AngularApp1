import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { PatientInfoComponent } from './patient-info/patient-info.component';

import {  HttpClientModule} from '@angular/common/http';
import { ClaimClinicDataComponent } from './claim-clinic-data/claim-clinic-data.component';
import { ApproutingModule } from './app-routing.module';
import { PagerServiceService } from './services/pager-service.service';
import { PatientService } from './patient.service';
import { AgGridModule } from "ag-grid-angular/main";
import { AngularGridComponent } from './angular-grid/angular-grid.component';



@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    PatientInfoComponent,
    ClaimClinicDataComponent,
    AngularGridComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ApproutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    AgGridModule.withComponents([])    
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
