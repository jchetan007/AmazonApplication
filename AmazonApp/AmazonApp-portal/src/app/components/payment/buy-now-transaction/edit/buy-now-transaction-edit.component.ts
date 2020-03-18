import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractBuyNowTransaction } from '../domain/abstract-buy-now-transaction';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

//import { BuyNowTransaction } from '@app/models';

@Component({
    selector: "app-buy-now-transaction-edit",
    templateUrl: './buy-now-transaction-edit.component.html'
})
export class BuyNowTransactionEditComponent extends AbstractBuyNowTransaction implements OnInit, OnDestroy {
   // buyNowTransaction: BuyNowTransaction;
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
           // this.buyNowTransactionFormGroup = this.formBuilder.formGroup(BuyNowTransaction,t) as IFormGroup<BuyNowTransaction>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
