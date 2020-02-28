import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractTransaction } from '../domain/abstract-transaction';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Transaction } from '@app/models';

@Component({
    selector: "app-transaction-edit",
    templateUrl: './transaction-edit.component.html'
})
export class TransactionEditComponent extends AbstractTransaction implements OnInit, OnDestroy {
    transaction: Transaction;
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
            this.transactionFormGroup = this.formBuilder.formGroup(Transaction,t) as IFormGroup<Transaction>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
