import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractvCartItem } from '../domain/abstract-v-cart-item';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { vCartItem } from '@app/models';

@Component({
    selector: "app-v-cart-item-edit",
    templateUrl: './v-cart-item-edit.component.html'
})
export class vCartItemEditComponent extends AbstractvCartItem implements OnInit, OnDestroy {
    vCartItem: vCartItem;
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
            this.vCartItemFormGroup = this.formBuilder.formGroup(vCartItem,t) as IFormGroup<vCartItem>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
