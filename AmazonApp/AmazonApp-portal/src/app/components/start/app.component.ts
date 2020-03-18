import { Component, OnInit } from '@angular/core';
import { HttpClientConfig, HttpResponse, http, RxHttp } from '@rxweb/http';
import { BrowserStorage } from 'src/app/domain/services/browser-storage';
import { Router, NavigationStart  } from '@angular/router';
import { ReactiveFormConfig } from '@rxweb/reactive-form-validators';
import { Product } from '@app/models';
import { Subscription } from 'rxjs';
import { FormGroup, FormBuilder } from '@angular/forms';
import { anonymous } from '@rxweb/angular-router';

import { Seller } from "@app/models";
import { List } from "@rxweb/generics"
import { AuthFilter } from 'src/app/temp-service/AuthFilter';


@anonymous()
@http({
    hostKey:"local",
    path:"api/SearchSearchProducts"
  })

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
})
export class AppComponent extends RxHttp implements OnInit{
 
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
    isShowNavbar: boolean = false;
    isShowAmazon: boolean = false;

  constructor(private browserStorage: BrowserStorage, private router: Router,private fb:FormBuilder) {super();
    this.router.events.forEach((event) => {
      if (event instanceof NavigationStart) {
        if ((event['url'] == '/login')|| (event['url'] == '/app-users/add')||(event['url'] == '/sellers/add')||(event['url']=='/prime-musics/add')) {
          this.isShowNavbar = false;
          this.isShowAmazon = true;
          
        }
        else {
          // console.log("NU")
          this.isShowNavbar = true;
          this.isShowAmazon = false;
        }
      }
    });
  }
  
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
    

    
    HttpClientConfig.register({
      hostURIs: [{
        name: 'server',
        default: false,
        uri: "https://localhost:44352"
      },
      {
        name: 'local',
        default: true,
        uri: "https://localhost:44352"// 'https://localhost:44376' 
      }],
      filters: [{ model: AuthFilter }],
      onError: (response: HttpResponse) => {
        if (response.statusCode == 401
        ) {
          // this.browserStorage.local.clearAll();
          // this.baseToastr.error("Timeout")
          // this.router.navigate(["/login"])
        }
        // else if (response.statusCode == HttpResponseCode.InternalServerError) {
        //   this.baseToastr.error("Error occur")
        // }
        else if (response.statusCode == 403) {
          this.router.navigate(["/unauthorized"]);
        }
      }
    })
    var auth = localStorage.getItem("auth");
    if (auth) {
      
      //this.router.navigate(["/product-main-categories"])
      this.isShowDashboard = true;
    }
    else {
      // this.browserStorage.local.clearAll();
      //this.router.navigate(["/login"])
      this.isShowDashboard = false;
    }

    ReactiveFormConfig.set({
      "validationMessage": {
        "required": "You can't leave this empty",
        "notEmpty": "You can't leave this empty",
        "minLength": "Minimum  characters required",
        "maxLength": "More than {{1}}  characters are not permitted",
        "pattern": "The specified input format is not recognized",
        "compare": "The specified values of {{0}} and {{1}} must be the same",
        "contains": "The specified value must ' in the input",
        "alpha": "You can use letters only",
        "alphaNumeric": "You can use letters, numbers and periods only",
        "range": "You need to enter appropriate value in this field",
        "maxNumber": "You can not enter value more than #n#",
        "numeric": "Only number required",
        "email": "Please enter valid email address",
        "latitude": "Please enter a valid latitude",
        "longitude": "Please enter a valid longitude",
        "url": "{{0}} Is not the correct url pattern.",
        "password": "Password length should be of 8 to 20 characters and should have atleast one uppercase, one lowercase letter, a number and a special character, without any whitespaces"
      }, "reactiveForm": { "errorMessageBindingStrategy": 1 }
    });
    // this.productformgroup=this.fb.group({
    //         product:['']
    //       })
  }

  loginClicked(isClicked: boolean): void {
    if (isClicked) {
      this.isShowDashboard = true;
      this.router.navigate(["/users"])
      setTimeout(() => { this.isShowDashboard = true; }, 50)

    }
  }
  
 
 
}


