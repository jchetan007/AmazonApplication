import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Seller } from '@app/models';
import { AbstractSeller } from '../domain/abstract-seller';

@Component({
    selector: "app-seller-add",
    templateUrl: './seller-add.component.html'
})
export class SellerAddComponent extends AbstractSeller implements OnInit, OnDestroy {
    seller: Seller;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.seller = new Seller();
        this.sellerFormGroup = this.formBuilder.formGroup(this.seller) as IFormGroup<Seller>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
