import { Component, ViewChild , OnInit } from "@angular/core";
import { PatientService } from "../patient.service"

@Component({
  selector: "angular-ClaimDatagrid",
  template: `<ag-grid-angular
    #agGrid
    style="width: 100%; height: 100%;"
    id="myGrid"
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
export class AngularGridComponent implements OnInit {
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
        headerName: "Age",
        field: "Age",
        width: 90,
        filter: "agNumberColumnFilter"
      },
      {
        headerName: "Gender",
        field: "Gender",
        width: 120
      },
      {
        headerName: "Service Code",
        field: "ServiceCode",
        width: 90
      },      
      {
        headerName: "Service Code Description",
        field: "Description",
        width: 110
      },      
      {
        headerName: "Revenue Code",
        field: "RevenueCode",
        width: 100,
        //filter: "agNumberColumnFilter",
        //suppressFilter: true
      },
      {
        headerName: "Revenue Code Description",
        field: "RevenueDescription",
        width: 110
      },
      {
        headerName: "Diagnosis Code",
        field: "DiagosisCode",
        width: 110
      }
    ];
  }

  onGridReady(params) {
    this.gridApi = params.api;
    this.gridColumnApi = params.columnApi;

    // this.http
    //   .get("https://raw.githubusercontent.com/ag-grid/ag-grid-docs/master/src/olympicWinners.json")
    //   .subscribe((data) => {
    //     this.rowData = data;
    //   });
  }
  LoadClaimData(){

    this._patientService.getClaimData().subscribe((tempdate) => {
      this.rowData = tempdate;      
    }, err => {
      console.log(err);
    });
  }


}
