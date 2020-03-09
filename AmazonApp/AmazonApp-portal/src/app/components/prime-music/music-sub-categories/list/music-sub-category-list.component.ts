import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMusicSubCategory } from '../domain/abstract-music-sub-category';
import { MusicSubCategory } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-music-sub-category-list",
    templateUrl:'./music-sub-category-list.component.html'
})
export class MusicSubCategoryListComponent extends AbstractMusicSubCategory implements OnInit, OnDestroy {
    musicSubCategories: List<MusicSubCategory>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<MusicSubCategory>) => {
            this.musicSubCategories = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
