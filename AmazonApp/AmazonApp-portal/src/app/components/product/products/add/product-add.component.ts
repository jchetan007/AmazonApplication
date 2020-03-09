import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Product } from '@app/models';
import { AbstractProduct } from '../domain/abstract-product';

@Component({
    selector: "app-product-add",
    templateUrl: './product-add.component.html'
})
export class ProductAddComponent extends AbstractProduct implements OnInit, OnDestroy {
    product: Product;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.product = new Product();
        this.productFormGroup = this.formBuilder.formGroup(this.product) as IFormGroup<Product>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
