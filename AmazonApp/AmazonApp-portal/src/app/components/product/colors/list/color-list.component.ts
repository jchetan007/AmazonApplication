import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractColor } from '../domain/abstract-color';
import { Color } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-color-list",
    templateUrl:'./color-list.component.html'
})
export class ColorListComponent extends AbstractColor implements OnInit, OnDestroy {
    colors: List<Color>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Color>) => {
            this.colors = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
