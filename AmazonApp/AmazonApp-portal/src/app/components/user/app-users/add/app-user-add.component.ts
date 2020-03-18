import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';
import { RxFormBuilder, RxFormGroup, RxwebValidators, IFormGroup } from '@rxweb/reactive-form-validators';
import { AppUser } from '@app/models';
import { AbstractAppUser } from '../domain/abstract-app-user';
import { anonymous } from '@rxweb/angular-router';
import { FormGroup, FormBuilder } from "@angular/forms"
import { List } from '@rxweb/generics';

@anonymous()
@Component({
    selector: "app-app-user-add",
    templateUrl: './app-user-add.component.html'
})
export class AppUserAddComponent extends AbstractAppUser implements OnInit,OnDestroy 
{
  public appUser: AppUser;
  userGroup:FormGroup;
    subscription: Subscription;
    result:any;
    id:number;
    otpStyle:any;
    mobileStyle:any;
    otpResponse:any;
    verifyOtpResponse:any;
    userFormGroup: FormGroup;
    otpFormGroup: FormGroup;

    constructor(private formBuilder: FormBuilder) {
        super();
    }

    ngOnInit(): void
     {
        // this.Post();       
        this.appUser = new AppUser();
        this.userFormGroup = this.formBuilder.group({

           appusername:['',RxwebValidators.compose({validators:[RxwebValidators.required(), RxwebValidators.alpha()] })] ,

           mobilenumber:['',RxwebValidators.compose({validators:[RxwebValidators.required(), RxwebValidators.digit(),RxwebValidators.range({minimumNumber:10  ,maximumNumber:10 })] })] ,

           emailid:[''] ,

           password:['',RxwebValidators.compose({validators:[RxwebValidators.required(), RxwebValidators.range({minimumNumber:8  ,maximumNumber:12 })] })] ,



     


        });

        this.otpFormGroup = this.formBuilder.group({
            otpnumber:['']
        });
       // this.userFormGroup.patchModelValue({["createdDate"]:this.currentdate,["roleId"]:1});
        }

        // Post()
        // {
        //         this.post({ body: {
        //             appusername:this.userFormGroup.controls.appusername.value,
        //             mobilenumber:this.userFormGroup.controls.mobilenumber.value,
        //             emailid:this.userFormGroup.controls.emailid.value,
        //             userPassword:this.userFormGroup.controls.password.value
        //         } }).subscribe(res => {
        //         this.result=res;
        //         console.log(this.result);
        //     })
           
        // }
        
        getOTP()
        {
            this.get({path:'api/Otps',params:[1],queryParams:{MobileNumber : this.userFormGroup.value.mobilenumber}}).subscribe(res=>{
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
            this.get({path:'api/VerifyOtps',params:[1],queryParams:{OtpId:this.otpResponse, OtpNumber:this.otpFormGroup.value.otpnumber, MobileNumber:this.userFormGroup.value.mobilenumber}}).subscribe(res => {
            this.verifyOtpResponse = res;
            console.log(res);
    
            if(res=="Successfully Verified")
            {
                this.post({path:'api/AppUsers',body:{ appusername:this.userFormGroup.value.appusername,
                    mobilenumber:this.userFormGroup.value.mobilenumber,
                    emailid:this.userFormGroup.value.emailid,
                    userPassword:this.userFormGroup.value.password}}).subscribe(res=>{
                    this.result=res;
                    console.log(res);
                })
                // sessionStorage.setItem("AppUserId",this.result);
                // console.log(  sessionStorage.setItem("AppUserId",this.result));
            }
        }
            )}
      
    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    } 
        // this.appUserFormGroup = this.formBuilder.formGroup(this.appUser) as IFormGroup<AppUser>;
    }

