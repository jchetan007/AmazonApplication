import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractAppUser } from '../domain/abstract-app-user';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { AppUser } from '@app/models';

@Component({
    selector: "app-app-user-edit",
    templateUrl: './app-user-edit.component.html'
})
export class AppUserEditComponent extends AbstractAppUser implements OnInit, OnDestroy {
    appUser: AppUser;
    subscription: Subscription;
    id: number;

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute) {
        super();
        this.activatedRoute.queryParams.subscribe(t => {
            this.id = t['id'];
        })
    }

    ngOnInit(): void {
        this.get({ params: [this.id] }).subscribe(t => {
            this.appUserFormGroup = this.formBuilder.formGroup(AppUser,t) as IFormGroup<AppUser>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
