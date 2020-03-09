import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { MusicSubCategory } from '@app/models';
import { AbstractMusicSubCategory } from '../domain/abstract-music-sub-category';

@Component({
    selector: "app-music-sub-category-add",
    templateUrl: './music-sub-category-add.component.html'
})
export class MusicSubCategoryAddComponent extends AbstractMusicSubCategory implements OnInit, OnDestroy {
    musicSubCategory: MusicSubCategory;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.musicSubCategory = new MusicSubCategory();
        this.musicSubCategoryFormGroup = this.formBuilder.formGroup(this.musicSubCategory) as IFormGroup<MusicSubCategory>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
