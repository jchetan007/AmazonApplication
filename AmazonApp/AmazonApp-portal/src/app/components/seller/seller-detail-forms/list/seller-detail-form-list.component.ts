import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractSellerDetailForm } from '../domain/abstract-seller-detail-form';
import { SellerDetailForm } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-seller-detail-form-list",
    templateUrl:'./seller-detail-form-list.component.html'
})
export class SellerDetailFormListComponent extends AbstractSellerDetailForm implements OnInit, OnDestroy {
    sellerDetailForms: List<SellerDetailForm>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<SellerDetailForm>) => {
            this.sellerDetailForms = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
