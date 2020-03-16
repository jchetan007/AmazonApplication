import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractSellerDetailForm } from '../domain/abstract-seller-detail-form';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { SellerDetailForm } from '@app/models';

@Component({
    selector: "app-seller-detail-form-edit",
    templateUrl: './seller-detail-form-edit.component.html'
})
export class SellerDetailFormEditComponent extends AbstractSellerDetailForm implements OnInit, OnDestroy {
    sellerDetailForm: SellerDetailForm;
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
            this.sellerDetailFormFormGroup = this.formBuilder.formGroup(SellerDetailForm,t) as IFormGroup<SellerDetailForm>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
