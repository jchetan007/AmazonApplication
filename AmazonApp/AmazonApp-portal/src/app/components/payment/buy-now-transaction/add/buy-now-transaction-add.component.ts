import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { BuyNowTransaction } from '@app/models';
import { AbstractBuyNowTransaction } from '../domain/abstract-buy-now-transaction';

@Component({
    selector: "app-buy-now-transaction-add",
    templateUrl: './buy-now-transaction-add.component.html'
})
export class BuyNowTransactionAddComponent extends AbstractBuyNowTransaction implements OnInit, OnDestroy {
    buyNowTransaction: BuyNowTransaction;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.buyNowTransaction = new BuyNowTransaction();
        this.buyNowTransactionFormGroup = this.formBuilder.formGroup(this.buyNowTransaction) as IFormGroup<BuyNowTransaction>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
