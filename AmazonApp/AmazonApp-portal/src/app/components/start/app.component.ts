import { Component, OnInit } from '@angular/core';
import { HttpClientConfig, HttpResponse } from '@rxweb/http';
import { BrowserStorage } from 'src/app/domain/services/browser-storage';
import { Router } from '@angular/router';
import { ReactiveFormConfig } from '@rxweb/reactive-form-validators';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
})
export class AppComponent implements OnInit{
  
  isShowDashboard:boolean = false;

  constructor(private browserStorage: BrowserStorage, private router: Router) {}
  
  ngOnInit(): void {
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
      filters: [],
      onError: (response: HttpResponse) => {
        if (response.statusCode == 401
        ) {
          this.browserStorage.local.clearAll();
          // this.baseToastr.error("Timeout")
          this.router.navigate(["/login"])
        }
        // else if (response.statusCode == HttpResponseCode.InternalServerError) {
        //   this.baseToastr.error("Error occur")
        // }
        else if (response.statusCode == 403) {
          this.router.navigate(["/unauthorized"]);
        }
      }
    })
    var auth = this.browserStorage.local.get("auth");
    if (auth) {
      this.router.navigate(["/users"])
      this.isShowDashboard = true;
    }
    else {
      this.browserStorage.local.clearAll();
      this.router.navigate(["/login"])
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
  }

  loginClicked(isClicked: boolean): void {
    if (isClicked) {
      this.isShowDashboard = true;
      this.router.navigate(["/users"])
      setTimeout(() => { this.isShowDashboard = true; }, 50)
    }
  }

}
