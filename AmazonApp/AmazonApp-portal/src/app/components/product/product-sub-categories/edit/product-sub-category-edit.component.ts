import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractProductSubCategory } from '../domain/abstract-product-sub-category';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { ProductSubCategory } from '@app/models';

@Component({
    selector: "app-product-sub-category-edit",
    templateUrl: './product-sub-category-edit.component.html'
})
export class ProductSubCategoryEditComponent extends AbstractProductSubCategory implements OnInit, OnDestroy {
    productSubCategory: ProductSubCategory;
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
            this.productSubCategoryFormGroup = this.formBuilder.formGroup(ProductSubCategory,t) as IFormGroup<ProductSubCategory>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
