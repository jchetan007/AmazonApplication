import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ProductMainCategory } from '@app/models';
import { AbstractProductMainCategory } from '../domain/abstract-product-main-category';


@Component({
    selector: "app-product-main-category-add",
    templateUrl: './product-main-category-add.component.html'
})
export class ProductMainCategoryAddComponent extends AbstractProductMainCategory implements OnInit, OnDestroy {
    productMainCategory: ProductMainCategory;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.productMainCategory = new ProductMainCategory();
        this.productMainCategoryFormGroup = this.formBuilder.formGroup(this.productMainCategory) as IFormGroup<ProductMainCategory>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
