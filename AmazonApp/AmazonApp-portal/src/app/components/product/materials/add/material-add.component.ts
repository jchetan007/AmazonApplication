import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Material } from '@app/models';
import { AbstractMaterial } from '../domain/abstract-material';

@Component({
    selector: "app-material-add",
    templateUrl: './material-add.component.html'
})
export class MaterialAddComponent extends AbstractMaterial implements OnInit, OnDestroy {
    material: Material;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.material = new Material();
        this.materialFormGroup = this.formBuilder.formGroup(this.material) as IFormGroup<Material>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
