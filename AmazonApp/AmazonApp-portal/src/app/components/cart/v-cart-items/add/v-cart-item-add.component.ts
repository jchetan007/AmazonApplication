import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { vCartItem } from '@app/models';
import { AbstractvCartItem } from '../domain/abstract-v-cart-item';

@Component({
    selector: "app-v-cart-item-add",
    templateUrl: './v-cart-item-add.component.html'
})
export class vCartItemAddComponent extends AbstractvCartItem implements OnInit, OnDestroy {
    vCartItem: vCartItem;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.vCartItem = new vCartItem();
        this.vCartItemFormGroup = this.formBuilder.formGroup(this.vCartItem) as IFormGroup<vCartItem>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
