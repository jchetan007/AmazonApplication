import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvPromoCode } from '../domain/abstract-v-promo-code';
import { vPromoCode } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-v-promo-code-list",
    templateUrl:'./v-promo-code-list.component.html'
})
export class vPromoCodeListComponent extends AbstractvPromoCode implements OnInit, OnDestroy {
    vPromoCodes: List<vPromoCode>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<vPromoCode>) => {
            this.vPromoCodes = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
