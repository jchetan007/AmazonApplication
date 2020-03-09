import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractCard } from '../domain/abstract-card';
import { Card } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-card-list",
    templateUrl:'./card-list.component.html'
})
export class CardListComponent extends AbstractCard implements OnInit, OnDestroy {
    cards: List<Card>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Card>) => {
            this.cards = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
