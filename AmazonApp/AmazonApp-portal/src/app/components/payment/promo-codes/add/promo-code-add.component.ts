import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { PromoCode } from '@app/models';
import { AbstractPromoCode } from '../domain/abstract-promo-code';

@Component({
    selector: "app-promo-code-add",
    templateUrl: './promo-code-add.component.html'
})
export class PromoCodeAddComponent extends AbstractPromoCode implements OnInit, OnDestroy {
    promoCode: PromoCode;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.promoCode = new PromoCode();
        this.promoCodeFormGroup = this.formBuilder.formGroup(this.promoCode) as IFormGroup<PromoCode>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
