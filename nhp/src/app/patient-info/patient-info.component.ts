import { Component, OnInit } from '@angular/core';
import { GridOptions } from "ag-grid/main";
import { PatientService } from "../patient.service"
import { Router } from '@angular/router';
import { PagerServiceService } from '../services/pager-service.service';

@Component({
  selector: 'app-patient-info',
  templateUrl: './patient-info.component.html',
  styleUrls: ['./patient-info.component.css']
})
export class PatientInfoComponent implements OnInit {

  public gridOptions: GridOptions;
  private claimData: any;
  private clinicData: any;
  
  // array of all items to be paged
 private allItems: any;

 // pager object
 pager: any = {};
 pager2: any = {};

 // paged items
 pagedItems: any[];

 pagedClinicItems : any[];

  constructor(private _patientService: PatientService, private router: Router, private pagerService: PagerServiceService) {
    //this._patientService.getClaimData().subscribe( resultArray => this.claimData = resultArray);

  }

  ngOnInit() {
    
  }
  onNext() {
    this.router.navigateByUrl('claimclinic');
  }
  LoadClaimData(){
    this._patientService.getClaimData().subscribe((tempdate) => {
      this.claimData = tempdate;
      this.allItems = tempdate;
      this.setClaimPage(1);
    }, err => {
      console.log(err);
    });
  }

  LoadClinicalData(){
    this._patientService.getClinicData().subscribe((t) => {
      this.clinicData = t;
      this.setClinicPage(1);
    }, err => {
      console.log(err);
    });
  }

  setClaimPage(page: number) {
    // get pager object from service
    this.pager = this.pagerService.getPager(this.allItems.length, page);

    // get current page of items
    this.pagedItems = this.allItems.slice(this.pager.startIndex, this.pager.endIndex + 1);
}

setClinicPage(page: number) {
  // get pager object from service
  this.pager2 = this.pagerService.getPager(this.clinicData.length, page);

  // get current page of items
  this.pagedClinicItems = this.clinicData.slice(this.pager2.startIndex, this.pager2.endIndex + 1);
}

}
