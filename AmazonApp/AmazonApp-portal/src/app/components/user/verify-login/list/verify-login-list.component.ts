import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractVerifyLogin } from '../domain/abstract-verify-login';
import { VerifyLogin } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-verify-login-list",
    templateUrl:'./verify-login-list.component.html'
})
export class VerifyLoginListComponent extends AbstractVerifyLogin implements OnInit, OnDestroy {
    verifyLogin: List<VerifyLogin>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<VerifyLogin>) => {
            this.verifyLogin = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
