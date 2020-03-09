import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { PromoCode } from '@app/models';
import { AbstractVerifyPromoCode } from '../domain/abstract-verify-promo-code';

@Component({
    selector: "app-verify-promo-code-add",
    templateUrl: './verify-promo-code-add.component.html'
})
export class VerifyPromoCodeAddComponent extends AbstractVerifyPromoCode implements OnInit, OnDestroy {
    verifyPromoCode: PromoCode;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.verifyPromoCode = new PromoCode();
        this.verifyPromoCodeFormGroup = this.formBuilder.formGroup(this.verifyPromoCode) as IFormGroup<PromoCode>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
