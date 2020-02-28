import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractPromoCode } from '../domain/abstract-promo-code';
import { PromoCode } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-promo-code-list",
    templateUrl:'./promo-code-list.component.html'
})
export class PromoCodeListComponent extends AbstractPromoCode implements OnInit, OnDestroy {
    promoCodes: List<PromoCode>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<PromoCode>) => {
            this.promoCodes = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
