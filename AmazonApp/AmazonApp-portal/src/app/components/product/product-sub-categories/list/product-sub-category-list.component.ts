import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProductSubCategory } from '../domain/abstract-product-sub-category';
import { ProductSubCategory } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-product-sub-category-list",
    templateUrl:'./product-sub-category-list.component.html'
})
export class ProductSubCategoryListComponent extends AbstractProductSubCategory implements OnInit, OnDestroy {
    productSubCategories: List<ProductSubCategory>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<ProductSubCategory>) => {
            this.productSubCategories = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
