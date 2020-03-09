import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractUserAddress } from '../domain/abstract-user-address';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { UserAddress } from '@app/models';

@Component({
    selector: "app-user-address-edit",
    templateUrl: './user-address-edit.component.html'
})
export class UserAddressEditComponent extends AbstractUserAddress implements OnInit, OnDestroy {
    userAddress: UserAddress;
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
            this.userAddressFormGroup = this.formBuilder.formGroup(UserAddress,t) as IFormGroup<UserAddress>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
