import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractOrder } from '../domain/abstract-order';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Order } from '@app/models';

@Component({
    selector: "app-order-edit",
    templateUrl: './order-edit.component.html'
})
export class OrderEditComponent extends AbstractOrder implements OnInit, OnDestroy {
    order: Order;
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
            this.orderFormGroup = this.formBuilder.formGroup(Order,t) as IFormGroup<Order>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
