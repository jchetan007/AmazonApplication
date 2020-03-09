import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractVerifyPromoCode } from '../domain/abstract-verify-promo-code';
import { PromoCode } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-verify-promo-code-list",
    templateUrl:'./verify-promo-code-list.component.html'
})
export class VerifyPromoCodeListComponent extends AbstractVerifyPromoCode implements OnInit, OnDestroy {
    verifyPromoCodes: List<PromoCode>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<PromoCode>) => {
            this.verifyPromoCodes = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
