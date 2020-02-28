import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractSize } from '../domain/abstract-size';
import { Size } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-size-list",
    templateUrl:'./size-list.component.html'
})
export class SizeListComponent extends AbstractSize implements OnInit, OnDestroy {
    sizes: List<Size>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Size>) => {
            this.sizes = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
