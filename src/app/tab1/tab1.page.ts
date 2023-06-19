import { ChangeDetectorRef, Component } from '@angular/core';
import { App } from '@capacitor/app';

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {

  url: string = '';

  constructor(private ref: ChangeDetectorRef) {
    App.addListener('appUrlOpen', data => {
      console.log('App opened with URL:', data);
      this.url += data.url + '\n';
      this.ref.detectChanges();
    }); 
  }
}
