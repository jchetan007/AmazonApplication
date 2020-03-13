import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { vPromoCode } from '@app/models';
import { AbstractvPromoCode } from '../domain/abstract-v-promo-code';

@Component({
    selector: "app-v-promo-code-add",
    templateUrl: './v-promo-code-add.component.html'
})
export class vPromoCodeAddComponent extends AbstractvPromoCode implements OnInit, OnDestroy {
    vPromoCode: vPromoCode;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.vPromoCode = new vPromoCode();
        this.vPromoCodeFormGroup = this.formBuilder.formGroup(this.vPromoCode) as IFormGroup<vPromoCode>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
