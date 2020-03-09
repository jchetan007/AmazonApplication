import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { CartItem } from '@app/models';
import { AbstractCartItem } from '../domain/abstract-cart-item';

@Component({
    selector: "app-cart-item-add",
    templateUrl: './cart-item-add.component.html'
})
export class CartItemAddComponent extends AbstractCartItem implements OnInit, OnDestroy {
    cartItem: CartItem;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.cartItem = new CartItem();
        this.cartItemFormGroup = this.formBuilder.formGroup(this.cartItem) as IFormGroup<CartItem>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
