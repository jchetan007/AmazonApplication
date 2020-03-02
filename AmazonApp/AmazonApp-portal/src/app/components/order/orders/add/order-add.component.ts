import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Order } from '@app/models';
import { AbstractOrder } from '../domain/abstract-order';

@Component({
    selector: "app-order-add",
    templateUrl: './order-add.component.html'
})
export class OrderAddComponent extends AbstractOrder implements OnInit, OnDestroy {
    order: Order;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.order = new Order();
        this.orderFormGroup = this.formBuilder.formGroup(this.order) as IFormGroup<Order>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
