import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractSeller } from '../domain/abstract-seller';
import { Seller } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-seller-list",
    templateUrl:'./seller-list.component.html'
})
export class SellerListComponent extends AbstractSeller implements OnInit, OnDestroy {
    sellers: List<Seller>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Seller>) => {
            this.sellers = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
