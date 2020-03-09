import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractVerifyOtp } from '../domain/abstract-verify-otp';
import { Otp } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-verify-otp-list",
    templateUrl:'./verify-otp-list.component.html'
})
export class VerifyOtpListComponent extends AbstractVerifyOtp implements OnInit, OnDestroy {
    verifyOtps: List<Otp>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Otp>) => {
            this.verifyOtps = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
