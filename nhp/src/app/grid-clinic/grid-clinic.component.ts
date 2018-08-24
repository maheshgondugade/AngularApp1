import { Component, OnInit } from '@angular/core';
import { PatientService } from "../patient.service"

@Component({
  selector: "angular-ClinicDataGrid",
  template: `<ag-grid-angular
    #agGrid
    style="width: 100%; height: 100%;"
    id="clinicGrid"
    [rowData]="rowData"
    class="ag-theme-balham"
    [columnDefs]="columnDefs"
    [enableFilter]="true"
    [enableSorting]="true"
    [enableColResize]="true"
    paginationPageSize = "15"
    (gridReady)="onGridReady($event)"
    ></ag-grid-angular>
`
})
export class GridClinicComponent implements OnInit {
  private gridApi;
  private gridColumnApi;
  private rowData: any = [];

  private columnDefs;
 
  ngOnInit() {
  }

  constructor(private _patientService: PatientService) {
    this.columnDefs = [
      {
        headerName: "Patient ID",
        field: "PatientID",
        width: 150
      },
      {
        headerName: "Marital Status",
        field: "MaritalStatus",
        width: 90
        //, filter: "agNumberColumnFilter"
      },
      {
        headerName: "Smoking",
        field: "Smoking",
        width: 120
      },
      {
        headerName: "Alcohol",
        field: "Alcohol",
        width: 90
      },      
      {
        headerName: "Prescribed Drugs",
        field: "PrescribedDrugs",
        width: 110
      },      
      {
        headerName: "Geography",
        field: "Geography",
        width: 100,
        //filter: "agNumberColumnFilter",
        //suppressFilter: true
      },
      {
        headerName: "Family History",
        field: "FamilyHistory",
        width: 110
        
      },
      {
        headerName: "Total No. of Readmission",
        field: "TotalReadmission",
        width: 110,
        cellStyle: {'text-align': 'center'}
      }
    ];
  }

  onGridReady(params) {
    this.gridApi = params.api;
    this.gridColumnApi = params.columnApi;
  }
  LoadClinicData(){
    this._patientService.getClinicData().subscribe((t) => {
      this.rowData = t;      
    }, err => {
      console.log(err);
    });
  }
}
