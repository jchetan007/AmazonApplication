import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { vMusic } from '@app/models';
import { AbstractvMusic } from '../domain/abstract-v-music';

@Component({
    selector: "app-v-music-add",
    templateUrl: './v-music-add.component.html'
})
export class vMusicAddComponent extends AbstractvMusic implements OnInit, OnDestroy {
    vMusic: vMusic;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.vMusic = new vMusic();
        this.vMusicFormGroup = this.formBuilder.formGroup(this.vMusic) as IFormGroup<vMusic>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
