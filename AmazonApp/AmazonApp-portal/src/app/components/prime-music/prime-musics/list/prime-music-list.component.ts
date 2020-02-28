import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractPrimeMusic } from '../domain/abstract-prime-music';
import { PrimeMusic } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-prime-music-list",
    templateUrl:'./prime-music-list.component.html'
})
export class PrimeMusicListComponent extends AbstractPrimeMusic implements OnInit, OnDestroy {
    primeMusics: List<PrimeMusic>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<PrimeMusic>) => {
            this.primeMusics = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
