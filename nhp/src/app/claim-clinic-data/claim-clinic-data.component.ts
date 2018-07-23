import { Component, OnInit } from '@angular/core';
import { PatientService } from '../patient.service';
import {PagerServiceService} from '../services/pager-service.service'

@Component({
  selector: 'app-claim-clinic-data',
  templateUrl: './claim-clinic-data.component.html',
  styleUrls: ['./claim-clinic-data.component.css']
})
export class ClaimClinicDataComponent implements OnInit {
private claimClinicData:any;

 // array of all items to be paged
 private allItems: any;

 // pager object
 pager: any = {};

 // paged items
 pagedItems: any[];

  constructor(private _patientService: PatientService, private pagerService : PagerServiceService ) { 

  }

  ngOnInit() {
    this._patientService.getPatientData().subscribe((tempdate) => {
      this.claimClinicData = tempdate;
      this.allItems = tempdate;
      this.setPage(1);
    }, err => {
      console.log(err);
    });

  }

  setPage(page: number) {
    // get pager object from service
    this.pager = this.pagerService.getPager(this.allItems.length, page);

    // get current page of items
    this.pagedItems = this.allItems.slice(this.pager.startIndex, this.pager.endIndex + 1);
}

}
