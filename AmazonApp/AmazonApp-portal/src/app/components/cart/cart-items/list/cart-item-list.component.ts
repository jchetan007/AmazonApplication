import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractCartItem } from '../domain/abstract-cart-item';
import { CartItem } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-cart-item-list",
    templateUrl:'./cart-item-list.component.html'
})
export class CartItemListComponent extends AbstractCartItem implements OnInit, OnDestroy {
    cartItems: List<CartItem>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<CartItem>) => {
            this.cartItems = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
