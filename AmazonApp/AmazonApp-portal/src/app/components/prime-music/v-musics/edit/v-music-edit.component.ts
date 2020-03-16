import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractvMusic } from '../domain/abstract-v-music';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { vMusic } from '@app/models';

@Component({
    selector: "app-v-music-edit",
    templateUrl: './v-music-edit.component.html'
})
export class vMusicEditComponent extends AbstractvMusic implements OnInit, OnDestroy {
    vMusic: vMusic;
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
            this.vMusicFormGroup = this.formBuilder.formGroup(vMusic,t) as IFormGroup<vMusic>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
