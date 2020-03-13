import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMusic } from '../domain/abstract-music';
import { Music } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-music-list",
    templateUrl:'./music-list.component.html'
})
export class MusicListComponent extends AbstractMusic implements OnInit, OnDestroy {
    musics: List<Music>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Music>) => {
            this.musics = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
