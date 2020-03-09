import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Card } from '@app/models';
import { AbstractCard } from '../domain/abstract-card';

@Component({
    selector: "app-card-add",
    templateUrl: './card-add.component.html'
})
export class CardAddComponent extends AbstractCard implements OnInit, OnDestroy {
    card: Card;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.card = new Card();
        this.cardFormGroup = this.formBuilder.formGroup(this.card) as IFormGroup<Card>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
