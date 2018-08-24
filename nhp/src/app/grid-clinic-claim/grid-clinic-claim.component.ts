import { Component, OnInit } from '@angular/core';
import { PatientService } from "../patient.service"

@Component({
  selector: "angular-clinicClaimGrid",
  template: `<ag-grid-angular
    #agGrid
    style="width: 100%; height: 100%;"
    id="clinicClaimGrid"
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
export class GridClinicClaimComponent implements OnInit {
  private gridApi;
  private gridColumnApi;
  private rowData: any = [];

  private columnDefs;
 
  ngOnInit() {
  }

  constructor(private _patientService: PatientService) {
    this.columnDefs = [
      {
        headerName: "Age",
        field: "Age",
        width: 70
      },
      {
        headerName: "Gender",
        field: "Gender",
        width: 90,
        cellStyle: {'text-align': 'center'}
      },
      {
        headerName: "Service Code",
        field: "ServiceCode",
        width: 120
      },
      {
        headerName: "Revenue Code",
        field: "RevenueCode",
        width: 120
      },      
      {
        headerName: "Diagnosis Code",
        field: "DiagosisCode",
        width: 140
      },      
      {
        headerName: "Smoking",
        field: "Smoking",
        width: 90,
        cellStyle: {'text-align': 'center'}
        //suppressFilter: true
      },
      {
        headerName: "Alcohol",
        field: "Alcohol",
        width: 90,
        cellStyle: {'text-align': 'center'}
        
      },
      {
        headerName: "Prescribed Drugs",
        field: "PrescribedDrugs",
        width: 110,
        cellStyle: {'text-align': 'center'}
      },
      {
        headerName: "Geography",
        field: "Geography",
        width: 110,
        cellStyle: {'text-align': 'center'}
      },
      {
        headerName: "Family History",
        field: "FamilyHistory",
        width: 110,
        cellStyle: {'text-align': 'center'}
      },
      {
        headerName: "Total No. of Readmission",
        field: "TotalReadmission",
        width: 130,
        cellStyle: {'text-align': 'center'}
      },
      {
        headerName: "Risk Score",
        field: "HCCCode",
        width: 130,
        cellStyle: {'text-align': 'center'}    
      }
    ];
  }

  onGridReady(params) {
    this.gridApi = params.api;
    this.gridColumnApi = params.columnApi;
    this.showRiskScore(false);
  }
  LoadData(){
    this._patientService.getPatientData().subscribe((t) => {
      this.rowData = t;      
    }, err => {
      console.log(err);
    });
  }
  showRiskScore(show) {
    this.gridColumnApi.setColumnVisible("HCCCode", show);
  }
}
