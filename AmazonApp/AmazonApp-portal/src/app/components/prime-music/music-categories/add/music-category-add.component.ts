import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { MusicCategory } from '@app/models';
import { AbstractMusicCategory } from '../domain/abstract-music-category';

@Component({
    selector: "app-music-category-add",
    templateUrl: './music-category-add.component.html'
})
export class MusicCategoryAddComponent extends AbstractMusicCategory implements OnInit, OnDestroy {
    musicCategory: MusicCategory;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.musicCategory = new MusicCategory();
        this.musicCategoryFormGroup = this.formBuilder.formGroup(this.musicCategory) as IFormGroup<MusicCategory>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
