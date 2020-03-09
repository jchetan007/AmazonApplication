import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { UserAddress } from '@app/models';
import { AbstractUserAddress } from '../domain/abstract-user-address';

@Component({
    selector: "app-user-address-add",
    templateUrl: './user-address-add.component.html'
})
export class UserAddressAddComponent extends AbstractUserAddress implements OnInit, OnDestroy {
    userAddress: UserAddress;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.userAddress = new UserAddress();
        this.userAddressFormGroup = this.formBuilder.formGroup(this.userAddress) as IFormGroup<UserAddress>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
