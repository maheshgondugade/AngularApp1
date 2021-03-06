import { Component, OnInit, ViewChild } from '@angular/core';
//import { PatientService } from '../patient.service';
import {  PagerServiceService } from '../services/pager-service.service'
import {  GridClinicClaimComponent  } from '../grid-clinic-claim/grid-clinic-claim.component'


@Component({
  selector: 'app-claim-clinic-data',
  templateUrl: './claim-clinic-data.component.html',
  styleUrls: ['./claim-clinic-data.component.css']
})
export class ClaimClinicDataComponent implements OnInit {

@ViewChild(GridClinicClaimComponent) _grid : GridClinicClaimComponent;

private claimClinicData:any;
private calculatedRisk:boolean  = true;

 // array of all items to be paged
 private allItems: any;

 // pager object
 pager: any = {};

 // paged items
 pagedItems: any[];

  constructor(private pagerService : PagerServiceService ) { 

  }

  ngOnInit() {

    this._grid.LoadData();    
    // this._patientService.getPatientData().subscribe((tempdate) => {
    //   this.claimClinicData = tempdate;
    //   this.allItems = tempdate;
    //   this.setPage(1);
    // }, err => {
    //   console.log(err);
    // });

    this.calculatedRisk = true;

  }

  setPage(page: number) {
    // get pager object from service
    this.pager = this.pagerService.getPager(this.allItems.length, page);

    // get current page of items
    this.pagedItems = this.allItems.slice(this.pager.startIndex, this.pager.endIndex + 1);
}
calculatRisk(){
  this._grid.showRiskScore(true);
  this.calculatedRisk=false;
}

}
