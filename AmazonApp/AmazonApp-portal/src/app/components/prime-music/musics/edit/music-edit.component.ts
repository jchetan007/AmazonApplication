import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractMusic } from '../domain/abstract-music';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Music } from '@app/models';

@Component({
    selector: "app-music-edit",
    templateUrl: './music-edit.component.html'
})
export class MusicEditComponent extends AbstractMusic implements OnInit, OnDestroy {
    music: Music;
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
            this.musicFormGroup = this.formBuilder.formGroup(Music,t) as IFormGroup<Music>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
