import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractSeller } from '../domain/abstract-seller';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Seller } from '@app/models';

@Component({
    selector: "app-seller-edit",
    templateUrl: './seller-edit.component.html'
})
export class SellerEditComponent extends AbstractSeller implements OnInit, OnDestroy {
    seller: Seller;
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
            this.sellerFormGroup = this.formBuilder.formGroup(Seller,t) as IFormGroup<Seller>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
