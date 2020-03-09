import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { ProductCategory } from '@app/models';
import { AbstractProductCategory } from '../domain/abstract-product-category';

@Component({
    selector: "app-product-category-add",
    templateUrl: './product-category-add.component.html'
})
export class ProductCategoryAddComponent extends AbstractProductCategory implements OnInit, OnDestroy {
    productCategory: ProductCategory;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.productCategory = new ProductCategory();
        this.productCategoryFormGroup = this.formBuilder.formGroup(this.productCategory) as IFormGroup<ProductCategory>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
