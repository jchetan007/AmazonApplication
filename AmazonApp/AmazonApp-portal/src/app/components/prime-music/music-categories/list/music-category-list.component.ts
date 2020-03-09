import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMusicCategory } from '../domain/abstract-music-category';
import { MusicCategory } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-music-category-list",
    templateUrl:'./music-category-list.component.html'
})
export class MusicCategoryListComponent extends AbstractMusicCategory implements OnInit, OnDestroy {
    musicCategories: List<MusicCategory>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<MusicCategory>) => {
            this.musicCategories = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
