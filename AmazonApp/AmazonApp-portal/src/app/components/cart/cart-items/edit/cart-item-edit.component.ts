import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractCartItem } from '../domain/abstract-cart-item';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { CartItem } from '@app/models';

@Component({
    selector: "app-cart-item-edit",
    templateUrl: './cart-item-edit.component.html'
})
export class CartItemEditComponent extends AbstractCartItem implements OnInit, OnDestroy {
    cartItem: CartItem;
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
            this.cartItemFormGroup = this.formBuilder.formGroup(CartItem,t) as IFormGroup<CartItem>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
