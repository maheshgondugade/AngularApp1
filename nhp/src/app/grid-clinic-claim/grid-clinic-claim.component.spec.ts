import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GridClinicClaimComponent } from './grid-clinic-claim.component';

describe('GridClinicClaimComponent', () => {
  let component: GridClinicClaimComponent;
  let fixture: ComponentFixture<GridClinicClaimComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GridClinicClaimComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GridClinicClaimComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
