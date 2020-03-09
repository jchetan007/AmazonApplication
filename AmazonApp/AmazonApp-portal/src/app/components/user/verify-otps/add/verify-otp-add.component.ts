import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Otp } from '@app/models';
import { AbstractVerifyOtp } from '../domain/abstract-verify-otp';

@Component({
    selector: "app-verify-otp-add",
    templateUrl: './verify-otp-add.component.html'
})
export class VerifyOtpAddComponent extends AbstractVerifyOtp implements OnInit, OnDestroy {
    Otp: Otp;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.Otp = new Otp();
        this.verifyOtpFormGroup = this.formBuilder.formGroup(this.Otp) as IFormGroup<Otp>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
