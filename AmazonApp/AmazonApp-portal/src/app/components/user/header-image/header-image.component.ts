import { Component, OnInit } from '@angular/core';
import { HttpClientConfig, HttpResponse, http, RxHttp } from '@rxweb/http';
import { BrowserStorage } from 'src/app/domain/services/browser-storage';
import { Router } from '@angular/router';
import { ReactiveFormConfig } from '@rxweb/reactive-form-validators';
import { Product } from '@app/models';
import { Subscription } from 'rxjs';
import { FormGroup, FormBuilder } from '@angular/forms';
import { anonymous } from '@rxweb/angular-router';

import { Seller } from "@app/models";
import { List } from "@rxweb/generics"


@anonymous()


@Component({
  selector: 'app-header-image',
  templateUrl: './header-image.component.html',
})
export class HeaderImageAppComponent extends RxHttp implements OnInit{
 
//   sellers: List<Seller>;
  isShowDashboard:boolean = false;
//   subscription:Subscription;
//   productformgroup:FormGroup;
    // proresult:any;
    // result:any;
  
   

  constructor(private browserStorage: BrowserStorage, private router: Router,private fb:FormBuilder) {super();}
  
  ngOnInit(): void {
    
    
    
  }
  

  
}


