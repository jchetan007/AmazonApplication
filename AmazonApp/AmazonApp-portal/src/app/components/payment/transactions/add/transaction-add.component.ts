import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Transaction } from '@app/models';
import { AbstractTransaction } from '../domain/abstract-transaction';

@Component({
    selector: "app-transaction-add",
    templateUrl: './transaction-add.component.html'
})
export class TransactionAddComponent extends AbstractTransaction implements OnInit, OnDestroy {
    transaction: Transaction;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.transaction = new Transaction();
        this.transactionFormGroup = this.formBuilder.formGroup(this.transaction) as IFormGroup<Transaction>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
