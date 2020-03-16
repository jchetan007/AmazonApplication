import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractvMusic } from '../domain/abstract-v-music';
import { vMusic } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-v-music-list",
    templateUrl:'./v-music-list.component.html'
})
export class vMusicListComponent extends AbstractvMusic implements OnInit, OnDestroy {
    vMusics: List<vMusic>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<vMusic>) => {
            this.vMusics = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
