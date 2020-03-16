import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractBuyNowTransaction } from '../domain/abstract-buy-now-transaction';
import { BuyNowTransaction } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-buy-now-transaction-list",
    templateUrl:'./buy-now-transaction-list.component.html'
})
export class BuyNowTransactionListComponent extends AbstractBuyNowTransaction implements OnInit, OnDestroy {
    buyNowTransaction: List<BuyNowTransaction>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<BuyNowTransaction>) => {
            this.buyNowTransaction = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
