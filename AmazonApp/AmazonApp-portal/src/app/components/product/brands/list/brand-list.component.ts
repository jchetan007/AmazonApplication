import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractBrand } from '../domain/abstract-brand';
import { Brand } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-brand-list",
    templateUrl:'./brand-list.component.html'
})
export class BrandListComponent extends AbstractBrand implements OnInit, OnDestroy {
    brands: List<Brand>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Brand>) => {
            this.brands = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
