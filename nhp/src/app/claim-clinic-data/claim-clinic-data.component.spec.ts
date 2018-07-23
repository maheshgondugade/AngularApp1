import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ClaimClinicDataComponent } from './claim-clinic-data.component';

describe('ClaimClinicDataComponent', () => {
  let component: ClaimClinicDataComponent;
  let fixture: ComponentFixture<ClaimClinicDataComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ClaimClinicDataComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ClaimClinicDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
