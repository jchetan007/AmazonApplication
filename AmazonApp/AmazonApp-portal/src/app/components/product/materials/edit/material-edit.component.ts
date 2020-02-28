import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractMaterial } from '../domain/abstract-material';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Material } from '@app/models';

@Component({
    selector: "app-material-edit",
    templateUrl: './material-edit.component.html'
})
export class MaterialEditComponent extends AbstractMaterial implements OnInit, OnDestroy {
    material: Material;
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
            this.materialFormGroup = this.formBuilder.formGroup(Material,t) as IFormGroup<Material>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
