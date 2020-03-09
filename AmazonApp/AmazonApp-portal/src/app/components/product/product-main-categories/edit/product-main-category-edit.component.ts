import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractProductMainCategory } from '../domain/abstract-product-main-category';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { ProductMainCategory } from '@app/models';

@Component({
    selector: "app-product-main-category-edit",
    templateUrl: './product-main-category-edit.component.html'
})
export class ProductMainCategoryEditComponent extends AbstractProductMainCategory implements OnInit, OnDestroy {
    productMainCategory: ProductMainCategory;
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
            this.productMainCategoryFormGroup = this.formBuilder.formGroup(ProductMainCategory,t) as IFormGroup<ProductMainCategory>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
