import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { PrimeMusic } from '@app/models';
import { AbstractPrimeMusic } from '../domain/abstract-prime-music';

@Component({
    selector: "app-prime-music-add",
    templateUrl: './prime-music-add.component.html'
})
export class PrimeMusicAddComponent extends AbstractPrimeMusic implements OnInit, OnDestroy {
    primeMusic: PrimeMusic;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.primeMusic = new PrimeMusic();
        this.primeMusicFormGroup = this.formBuilder.formGroup(this.primeMusic) as IFormGroup<PrimeMusic>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
