import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { VerifyLogin } from '@app/models';
import { AbstractVerifyLogin } from '../domain/abstract-verify-login';

@Component({
    selector: "app-verify-login-add",
    templateUrl: './verify-login-add.component.html'
})
export class VerifyLoginAddComponent extends AbstractVerifyLogin implements OnInit, OnDestroy {
    verifyLogin: VerifyLogin;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.verifyLogin = new VerifyLogin();
        this.verifyLoginFormGroup = this.formBuilder.formGroup(this.verifyLogin) as IFormGroup<VerifyLogin>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
