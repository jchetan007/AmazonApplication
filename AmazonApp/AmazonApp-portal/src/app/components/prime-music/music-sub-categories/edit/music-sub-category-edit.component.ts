import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractMusicSubCategory } from '../domain/abstract-music-sub-category';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { MusicSubCategory } from '@app/models';

@Component({
    selector: "app-music-sub-category-edit",
    templateUrl: './music-sub-category-edit.component.html'
})
export class MusicSubCategoryEditComponent extends AbstractMusicSubCategory implements OnInit, OnDestroy {
    musicSubCategory: MusicSubCategory;
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
            this.musicSubCategoryFormGroup = this.formBuilder.formGroup(MusicSubCategory,t) as IFormGroup<MusicSubCategory>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
