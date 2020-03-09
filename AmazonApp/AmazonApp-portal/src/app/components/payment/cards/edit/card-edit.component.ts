import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractCard } from '../domain/abstract-card';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Card } from '@app/models';

@Component({
    selector: "app-card-edit",
    templateUrl: './card-edit.component.html'
})
export class CardEditComponent extends AbstractCard implements OnInit, OnDestroy {
    card: Card;
    subscription: Subscription;
    id: number;

    constructor(private formBuilder: RxFormBuilder, private activatedRoute: ActivatedRoute) {
        super();
        this.activatedRoute.queryParams.subscribe(t => {
            this.id = t['id'];
        })
    }

    ngOnInit(): void {
        this.get({ params: [this.id] }).subscribe(t => {
            this.cardFormGroup = this.formBuilder.formGroup(Card,t) as IFormGroup<Card>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
