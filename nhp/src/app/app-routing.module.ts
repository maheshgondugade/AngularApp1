import { NgModule } from '@angular/core'
import { RouterModule, Routes } from '@angular/router'
import { LoginComponent } from './login/login.component'
import { PatientInfoComponent } from './patient-info/patient-info.component'
import { ClaimClinicDataComponent } from './claim-clinic-data/claim-clinic-data.component'
import {AuthGuard} from './gurad/auth.guard';



const routes: Routes = [
    { 
        path: 'login', 
        component: LoginComponent 
    },
    { 
        path: 'patientinfo', 
        component: PatientInfoComponent,canActivate:[AuthGuard]
    },
    { 
        path: 'claimclinic',
        component: ClaimClinicDataComponent 
    },
    {
        path: '', 
        component: LoginComponent 
    }
]

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule],
    declarations: []
})
export class ApproutingModule {

}
