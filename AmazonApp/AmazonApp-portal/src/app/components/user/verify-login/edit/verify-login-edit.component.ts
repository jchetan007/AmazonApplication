import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractVerifyLogin } from '../domain/abstract-verify-login';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { VerifyLogin } from '@app/models';

@Component({
    selector: "app-verify-login-edit",
    templateUrl: './verify-login-edit.component.html'
})
export class VerifyLoginEditComponent extends AbstractVerifyLogin implements OnInit, OnDestroy {
    verifyLogin: VerifyLogin;
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
            this.verifyLoginFormGroup = this.formBuilder.formGroup(VerifyLogin,t) as IFormGroup<VerifyLogin>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
