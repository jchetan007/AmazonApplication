import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractUserAddress } from '../domain/abstract-user-address';
import { UserAddress } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-user-address-list",
    templateUrl:'./user-address-list.component.html'
})
export class UserAddressListComponent extends AbstractUserAddress implements OnInit, OnDestroy {
    userAddresses: List<UserAddress>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<UserAddress>) => {
            this.userAddresses = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
