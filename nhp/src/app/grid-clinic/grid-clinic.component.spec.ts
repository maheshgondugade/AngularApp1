import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GridClinicComponent } from './grid-clinic.component';

describe('GridClinicComponent', () => {
  let component: GridClinicComponent;
  let fixture: ComponentFixture<GridClinicComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GridClinicComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GridClinicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
