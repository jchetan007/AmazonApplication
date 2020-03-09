import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractVerifyPromoCode } from '../domain/abstract-verify-promo-code';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { PromoCode } from '@app/models';

@Component({
    selector: "app-verify-promo-code-edit",
    templateUrl: './verify-promo-code-edit.component.html'
})
export class VerifyPromoCodeEditComponent extends AbstractVerifyPromoCode implements OnInit, OnDestroy {
    verifyPromoCode: PromoCode;
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
            this.verifyPromoCodeFormGroup = this.formBuilder.formGroup(PromoCode,t) as IFormGroup<PromoCode>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
