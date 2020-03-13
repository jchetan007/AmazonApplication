import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractvPromoCode } from '../domain/abstract-v-promo-code';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { vPromoCode } from '@app/models';

@Component({
    selector: "app-v-promo-code-edit",
    templateUrl: './v-promo-code-edit.component.html'
})
export class vPromoCodeEditComponent extends AbstractvPromoCode implements OnInit, OnDestroy {
    vPromoCode: vPromoCode;
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
            this.vPromoCodeFormGroup = this.formBuilder.formGroup(vPromoCode,t) as IFormGroup<vPromoCode>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
