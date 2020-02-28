import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractPrimeMusic } from '../domain/abstract-prime-music';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { PrimeMusic } from '@app/models';

@Component({
    selector: "app-prime-music-edit",
    templateUrl: './prime-music-edit.component.html'
})
export class PrimeMusicEditComponent extends AbstractPrimeMusic implements OnInit, OnDestroy {
    primeMusic: PrimeMusic;
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
            this.primeMusicFormGroup = this.formBuilder.formGroup(PrimeMusic,t) as IFormGroup<PrimeMusic>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
