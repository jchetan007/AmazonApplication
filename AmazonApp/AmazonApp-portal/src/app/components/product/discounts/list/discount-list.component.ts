import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractDiscount } from '../domain/abstract-discount';
import { Discount } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-discount-list",
    templateUrl:'./discount-list.component.html'
})
export class DiscountListComponent extends AbstractDiscount implements OnInit, OnDestroy {
    discounts: List<Discount>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Discount>) => {
            this.discounts = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
