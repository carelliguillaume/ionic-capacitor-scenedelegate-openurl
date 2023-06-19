import { TestBed } from '@angular/core/testing';

import { OpenurlService } from './openurl.service';

describe('OpenurlService', () => {
  let service: OpenurlService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(OpenurlService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
