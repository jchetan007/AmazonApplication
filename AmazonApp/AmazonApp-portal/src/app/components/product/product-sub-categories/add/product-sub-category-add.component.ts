import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { ProductSubCategory } from '@app/models';
import { AbstractProductSubCategory } from '../domain/abstract-product-sub-category';

@Component({
    selector: "app-product-sub-category-add",
    templateUrl: './product-sub-category-add.component.html'
})
export class ProductSubCategoryAddComponent extends AbstractProductSubCategory implements OnInit, OnDestroy {
    productSubCategory: ProductSubCategory;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.productSubCategory = new ProductSubCategory();
        this.productSubCategoryFormGroup = this.formBuilder.formGroup(this.productSubCategory) as IFormGroup<ProductSubCategory>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
