import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup, RxFormGroup, RxwebValidators } from '@rxweb/reactive-form-validators';
import { PrimeMusic } from '@app/models';
import { AbstractPrimeMusic } from '../domain/abstract-prime-music';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { anonymous } from '@rxweb/angular-router';

@anonymous()
@Component({
    selector: "app-prime-music-add",
    templateUrl: './prime-music-add.component.html'
})
export class PrimeMusicAddComponent extends AbstractPrimeMusic implements OnInit {
    result: unknown;
    
    
    primeMusic: PrimeMusic;
    subscription: Subscription;
    userFormGroup1: FormGroup;
    userFormGroup2: FormGroup;
    userFormGroup3: FormGroup;
    otpStyle:any;
    mobileStyle:any;
    otpResponse:any;
    verifyOtpResponse:any;
    


    constructor(private formBuilder: RxFormBuilder, private router: Router) {
        super();
    }

    ngOnInit(): void {
        console.log("Prime Music")
        this.userFormGroup1 = <RxFormGroup>this.formBuilder.group({
            mobilenumber:['',RxwebValidators.digit()],
        });

            this.userFormGroup2 = <RxFormGroup>this.formBuilder.group({
            password:['',RxwebValidators.required()],
        });

            this.userFormGroup3 = <RxFormGroup>this.formBuilder.group({
            otp:['',RxwebValidators.required()]
    });
    // this.Post();
}
// Post() {
//     this.post({body: {
//         mobilenumber:this.userFormGroup1.controls.mobilenumber.value,
//         password:this.userFormGroup2.controls.password.value,
//         otp:this.userFormGroup3.controls.otp.value,}}).subscribe(t => {
//             this.result=t;
//         }
//     )} 


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
        this.get({path:'api/VerifyOtps',params:[1],queryParams:{OtpId:this.otpResponse, OtpNumber:this.userFormGroup3.value.otp, MobileNumber:this.userFormGroup1.value.mobilenumber}}).subscribe(res => {
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
                //this.router.navigateByUrl('/music-categories/list/1')
                location.replace('/music-categories/list/1')
            })
        
        }
        
    }
        )}


  
    }

