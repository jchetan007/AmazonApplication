import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { SellerDetailForm } from '@app/models';
import { AbstractSellerDetailForm } from '../domain/abstract-seller-detail-form';

@Component({
    selector: "app-seller-detail-form-add",
    templateUrl: './seller-detail-form-add.component.html'
})
export class SellerDetailFormAddComponent extends AbstractSellerDetailForm implements OnInit, OnDestroy {
    sellerDetailForm: SellerDetailForm;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.sellerDetailForm = new SellerDetailForm();
        this.sellerDetailFormFormGroup = this.formBuilder.formGroup(this.sellerDetailForm) as IFormGroup<SellerDetailForm>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
