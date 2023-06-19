import { APP_INITIALIZER, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { App } from '@capacitor/app';
import { OpenurlService } from './common/services/openurl.service';

export const initializeApp = (openurlService: OpenurlService) => {
  return (): any => {
    App.addListener('appUrlOpen', data => {
      console.log('3B - App opened with URL:', data);
      openurlService.initialize(data.url);
    }); 
  };
};

@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule, IonicModule.forRoot(), AppRoutingModule],
  providers: [
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy },
    OpenurlService,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApp,
      multi: true,
      deps: [OpenurlService],
    },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
