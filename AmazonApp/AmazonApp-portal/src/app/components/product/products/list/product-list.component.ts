import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractProduct } from '../domain/abstract-product';
import { Product } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router';
@anonymous()
@Component({
    selector:"app-product-list",
    templateUrl:'./product-list.component.html'
})
export class ProductListComponent extends AbstractProduct implements OnInit, OnDestroy {
    products: List<Product>;
    subscription: Subscription;

    ngOnInit(): void {
        this.get();
      }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

    Get() {
        this.subscription = this.get().subscribe((t: List<Product>) => {
            this.products = t;
            
        })
        console.log(this.products);
    }

}
