import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractProductCategory } from '../domain/abstract-product-category';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { ProductCategory } from '@app/models';

@Component({
    selector: "app-product-category-edit",
    templateUrl: './product-category-edit.component.html'
})
export class ProductCategoryEditComponent extends AbstractProductCategory implements OnInit, OnDestroy {
    productCategory: ProductCategory;
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
            this.productCategoryFormGroup = this.formBuilder.formGroup(ProductCategory,t) as IFormGroup<ProductCategory>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
