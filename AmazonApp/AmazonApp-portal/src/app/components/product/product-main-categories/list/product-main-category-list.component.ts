import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProductMainCategory } from '../domain/abstract-product-main-category';
import { ProductMainCategory } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-product-main-category-list",
    templateUrl:'./product-main-category-list.component.html'
})
export class ProductMainCategoryListComponent extends AbstractProductMainCategory implements OnInit, OnDestroy {
    productMainCategories: List<ProductMainCategory>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<ProductMainCategory>) => {
            this.productMainCategories = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
