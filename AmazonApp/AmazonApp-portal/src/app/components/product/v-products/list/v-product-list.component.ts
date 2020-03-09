import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvProduct } from '../domain/abstract-v-product';
import { vProduct } from "@app/models";
import { Subscription } from 'rxjs';
import { anonymous } from '@rxweb/angular-router';
@anonymous()
@Component({
    selector:"app-v-product-list",
    templateUrl:'./v-product-list.component.html'
})
export class vProductListComponent extends AbstractvProduct implements OnInit, OnDestroy {
    vProducts: List<vProduct>;
    subscription: Subscription;

    ngOnInit(): void {
        this.get();
      }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

    Get() {
        this.subscription = this.get().subscribe((t: List<vProduct>) => {
            this.vProducts = t;
            
        })
        console.log(this.vProducts);
    }


}
