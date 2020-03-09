import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractProduct } from '../domain/abstract-product';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Product } from '@app/models';

@Component({
    selector: "app-product-edit",
    templateUrl: './product-edit.component.html'
})
export class ProductEditComponent extends AbstractProduct implements OnInit, OnDestroy {
    product: Product;
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
            this.productFormGroup = this.formBuilder.formGroup(Product,t) as IFormGroup<Product>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
