import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractMusicCategory } from '../domain/abstract-music-category';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { MusicCategory } from '@app/models';

@Component({
    selector: "app-music-category-edit",
    templateUrl: './music-category-edit.component.html'
})
export class MusicCategoryEditComponent extends AbstractMusicCategory implements OnInit, OnDestroy {
    musicCategory: MusicCategory;
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
            this.musicCategoryFormGroup = this.formBuilder.formGroup(MusicCategory,t) as IFormGroup<MusicCategory>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
