import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProductCategory } from '../domain/abstract-product-category';
import { ProductCategory } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-product-category-list",
    templateUrl:'./product-category-list.component.html'
})
export class ProductCategoryListComponent extends AbstractProductCategory implements OnInit, OnDestroy {
    productCategories: List<ProductCategory>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<ProductCategory>) => {
            this.productCategories = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
