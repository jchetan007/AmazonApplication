import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractOtp } from '../domain/abstract-otp';
import { Otp } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-otp-list",
    templateUrl:'./otp-list.component.html'
})
export class OtpListComponent extends AbstractOtp implements OnInit, OnDestroy {
    otps: List<Otp>;
    subscription: Subscription;

    ngOnInit(): void {
        this.get();
        }

        Get() {
            this.subscription = this.get().subscribe((t: List<Otp>) => {
                this.otps = t;
        
            })
            console.log(this.otps)
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
