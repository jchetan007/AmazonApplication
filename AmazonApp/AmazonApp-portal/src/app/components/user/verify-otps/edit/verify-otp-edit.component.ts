import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractVerifyOtp } from '../domain/abstract-verify-otp';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import {Otp } from '@app/models';

@Component({
    selector: "app-verify-otp-edit",
    templateUrl: './verify-otp-edit.component.html'
})
export class VerifyOtpEditComponent extends AbstractVerifyOtp implements OnInit, OnDestroy {
    Otp: Otp;
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
            this.verifyOtpFormGroup = this.formBuilder.formGroup(Otp,t) as IFormGroup<Otp>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
