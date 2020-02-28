import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractMaterial } from '../domain/abstract-material';
import { Material } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-material-list",
    templateUrl:'./material-list.component.html'
})
export class MaterialListComponent extends AbstractMaterial implements OnInit, OnDestroy {
    materials: List<Material>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Material>) => {
            this.materials = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
