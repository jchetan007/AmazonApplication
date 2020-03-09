import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { vProduct } from '@app/models';
import { AbstractvProduct } from '../domain/abstract-v-product';

@Component({
    selector: "app-v-product-add",
    templateUrl: './v-product-add.component.html'
})
export class vProductAddComponent extends AbstractvProduct implements OnInit, OnDestroy {
    vProduct: vProduct;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.vProduct = new vProduct();
        this.vProductFormGroup = this.formBuilder.formGroup(this.vProduct) as IFormGroup<vProduct>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
