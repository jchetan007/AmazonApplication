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
@http({
    hostKey:"local",
    path:"api/SearchSearchProducts"
  })

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
})
export class HeaderAppComponent extends RxHttp implements OnInit{
 
  sellers: List<Seller>;
  isShowDashboard:boolean = false;
  subscription:Subscription;
  productformgroup:FormGroup;
    proresult:any;
    result:any;
  
    appUserId:any;
    showLoginButton = false;
    showSignUpButton = false;
    showLogoutButton = false;

  constructor(private browserStorage: BrowserStorage, private router: Router,private fb:FormBuilder) {super();}
  
  ngOnInit(): void {
    this.productformgroup=this.fb.group({
      product:['']
    })
    this.appUserId = localStorage.getItem("AppUserId");
    if(this.appUserId === null){
      this.showLoginButton = true;
      this.showSignUpButton = true;
      this.showLogoutButton = false
      console.log('not login')
    }else{
      console.log('login')
      this.showLoginButton = false;
      this.showSignUpButton = false;
      this.showLogoutButton = true;
    }
    console.log(this.appUserId)
  }
  

  SearchProduct()
{
  this.post({ body: {Product: this.productformgroup.controls.product.value} }).subscribe(res=>
    {
      this.result=res;
      // console.log(this.result);
      this.proresult=JSON.parse(this.result);
      console.log(this.proresult);

    })
}

Login() {
 
  this.router.navigateByUrl('/login')
  
 // this.router.navigate(['/login']);
}
SignUp() {
  this.router.navigateByUrl('app-users/add')
}


Logout() {
  localStorage.clear();
  sessionStorage.clear();
  this.showLoginButton = true;
  this.showSignUpButton = true;
  this.showLogoutButton = false;
  this.router.navigateByUrl('product-main-categories')
}


}


