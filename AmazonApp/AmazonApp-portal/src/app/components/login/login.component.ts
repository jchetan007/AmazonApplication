import { Component, OnInit } from '@angular/core';
import { anonymous, middleware } from '@rxweb/angular-router'
import { multilingual } from '@rxweb/localization'
import { CoreComponent } from '@rxweb/angular-router';
import { LoggedInMiddleware } from '../../domain/security/middleware/logged-in.middleware';
import { RxwebValidators, RxFormGroup } from '@rxweb/reactive-form-validators';
import { FormGroup, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';

@middleware([LoggedInMiddleware])
@multilingual("loginComponent")
@anonymous()
@Component({
    templateUrl: './login.component.html',
})
export class LoginComponent extends CoreComponent implements OnInit {
    userFormGroup1: FormGroup;
    userFormGroup2: FormGroup;
    otpStyle:any;
    mobileStyle:any;
    otpResponse:any;
    verifyOtpResponse:any;
    result:any;



    constructor(
        private formBuilder: FormBuilder,
        private router: Router)
    {
        super();
    }

    ngOnInit(): void {
        this.userFormGroup1 =this.formBuilder.group({
            mobilenumber:[''],
            password:['']
        });

            this.userFormGroup2 =this.formBuilder.group({
                otpnumber:['']
        });

          
            
       // throw new Error("Method not implemented.");
  
}

// Post()
// {
//         this.post({ body: {
            
//             mobilenumber:this.userFormGroup1.controls.mobilenumber.value,
//             password:this.userFormGroup1.controls.password.value,
//             otp:this.userFormGroup2.controls.otp.value,
//         } }).subscribe(res => {
//         this.result=res;
//         console.log(this.result);
//     })
   
// }

getOTP()
        {
            this.get({path:'api/Otps',params:[1],queryParams:{MobileNumber : this.userFormGroup1.value.mobilenumber}}).subscribe(res=>{
                this.otpResponse=res;
                if(this.otpResponse==1)
                {
                    this.otpStyle={
                        'display':'none'
                    }
                }
                else
                {
                    this.otpStyle={
                        'display':''
                    }
                    this.mobileStyle={
                        'display':"none"
                    }
                }
    
                console.log(res);
                alert(res);
            })
        }
    
        otpSubmit()
        {
            this.get({path:'api/VerifyOtps',params:[1],queryParams:{OtpId:this.otpResponse, OtpNumber:this.userFormGroup2.value.otpnumber, MobileNumber:this.userFormGroup1.value.mobilenumber}}).subscribe(res => {
            this.verifyOtpResponse = res;
            console.log(res);
    
            if(res=="Successfully Verified")
            {
                // this.post({path:'api/AppUsers',body:{ appusername:this.userFormGroup.value.appusername,
                //     mobilenumber:this.userFormGroup.value.mobilenumber,
                //     emailid:this.userFormGroup.value.emailid,
                //     userPassword:this.userFormGroup.value.password}}).subscribe(res=>{
                //     this.result=res;
                //     console.log(res);
                // })
                this.get().subscribe(res => {
                    this.result = res;
                    console.log(res);
                })
            
            }
        }
            )}
}