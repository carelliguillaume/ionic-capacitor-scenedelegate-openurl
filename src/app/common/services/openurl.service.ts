import { Injectable } from '@angular/core';
import { ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class OpenurlService {

  constructor(private toastController: ToastController) { }

  initialize(message: string): void {
    this.presentToast('top', message);
  }

  async presentToast(position: 'top' | 'middle' | 'bottom', message: string) {
    const toast = await this.toastController.create({
      message: 'URL: ' + message,
      duration: 10000,
      position: position,
      buttons: [
        {
          text: 'Dismiss',
          role: 'cancel',
          handler: () => {
          },
        },
      ],
    });

    await toast.present();
  }
}
