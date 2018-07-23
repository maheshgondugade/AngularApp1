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

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    PatientInfoComponent,
    ClaimClinicDataComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ApproutingModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [PagerServiceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
