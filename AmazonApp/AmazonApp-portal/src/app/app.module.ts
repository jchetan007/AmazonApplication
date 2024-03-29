import { BrowserModule } from '@angular/platform-browser';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { RouterModule, PreloadAllModules } from '@angular/router';
import { RxWebModule } from './rxweb.module'
import { AppComponent } from './components/start/app.component';
import { ROUTES } from './components/start/routing'
import { RxHttp } from '@rxweb/http';
import { BaseToastr } from './domain/customize-design/toastr';
import { ModalView } from './domain/customize-design/modal';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RxReactiveFormsModule } from '@rxweb/reactive-form-validators';
import { HeaderAppComponent } from './components/user/header/header.component';
//import { SellerAddComponent } from './components/sellers/add/seller-add.component';

const route = RouterModule.forRoot(ROUTES, { preloadingStrategy: PreloadAllModules, onSameUrlNavigation: 'reload' });
@NgModule({
  declarations: [
    AppComponent,HeaderAppComponent
  ],
  imports: [
    BrowserModule, route, RxWebModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule
  ],
  providers: [RxHttp, BaseToastr, ModalView],
  bootstrap: [AppComponent],
  exports: [RouterModule],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
