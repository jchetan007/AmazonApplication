import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvCartItem } from '../domain/abstract-v-cart-item';
import { vCartItem } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-v-cart-item-list",
    templateUrl:'./v-cart-item-list.component.html'
})
export class vCartItemListComponent extends AbstractvCartItem implements OnInit, OnDestroy {
    vCartItems: List<vCartItem>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<vCartItem>) => {
            this.vCartItems = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
