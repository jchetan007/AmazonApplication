import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Music } from '@app/models';
import { AbstractMusic } from '../domain/abstract-music';

@Component({
    selector: "app-music-add",
    templateUrl: './music-add.component.html'
})
export class MusicAddComponent extends AbstractMusic implements OnInit, OnDestroy {
    music: Music;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.music = new Music();
        this.musicFormGroup = this.formBuilder.formGroup(this.music) as IFormGroup<Music>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
