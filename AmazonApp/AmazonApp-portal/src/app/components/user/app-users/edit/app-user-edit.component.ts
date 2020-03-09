import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractAppUser } from '../domain/abstract-app-user';

import { Subscription } from 'rxjs';
import { RxFormBuilder, RxFormGroup, RxwebValidators } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { AppUser } from '@app/models';
import { anonymous } from '@rxweb/angular-router';
import { FormBuilder, FormGroup } from '@angular/forms';

@anonymous()
@Component({
    selector: "app-app-user-edit",
    templateUrl: './app-user-edit.component.html'
})
export class AppUserEditComponent extends AbstractAppUser implements OnInit, OnDestroy {
    appUser: AppUser;
    subscription: Subscription;
    id: number;
    userFormGroup: FormGroup;
    result:any;
    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute) {
        super();
        this.activatedRoute.queryParams.subscribe(t => {
            this.id = t['id'];
        })
    }

    ngOnInit(): void {
        //this.Post();
        this.appUser = new AppUser();
        this.userFormGroup =this.formBuilder.group({
            
            fullname:[''],
      
            mobilenumber:[''],

            pincode:[''],
    
            flat:[''],

            area:[''],

            landmark:[''],

            city:[''],

            state:['']
        })
    }

        Post() {
            this.post({ body: {
               
              
                // flat:this.userFormGroup.controls.flat.value,
                area:this.userFormGroup.controls.area.value,
                landmark:this.userFormGroup.controls.landmark.value,
                city:this.userFormGroup.controls.city.value,
                state:this.userFormGroup.controls.state.value,appUserId:1 } }).subscribe(t => {
                    this.result=t;
            
              }
  )}

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}


