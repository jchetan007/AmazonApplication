import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { AppUser } from '@app/models';
import { AbstractAppUser } from '../domain/abstract-app-user';

@Component({
    selector: "app-app-user-add",
    templateUrl: './app-user-add.component.html'
})
export class AppUserAddComponent extends AbstractAppUser implements OnInit, OnDestroy {
    appUser: AppUser;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.appUser = new AppUser();
        this.appUserFormGroup = this.formBuilder.formGroup(this.appUser) as IFormGroup<AppUser>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
