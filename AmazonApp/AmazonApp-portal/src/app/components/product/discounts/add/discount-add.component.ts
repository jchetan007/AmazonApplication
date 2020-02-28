import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Discount } from '@app/models';
import { AbstractDiscount } from '../domain/abstract-discount';

@Component({
    selector: "app-discount-add",
    templateUrl: './discount-add.component.html'
})
export class DiscountAddComponent extends AbstractDiscount implements OnInit, OnDestroy {
    discount: Discount;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.discount = new Discount();
        this.discountFormGroup = this.formBuilder.formGroup(this.discount) as IFormGroup<Discount>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
