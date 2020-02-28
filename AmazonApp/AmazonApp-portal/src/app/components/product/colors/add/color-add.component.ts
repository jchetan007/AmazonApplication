import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Color } from '@app/models';
import { AbstractColor } from '../domain/abstract-color';

@Component({
    selector: "app-color-add",
    templateUrl: './color-add.component.html'
})
export class ColorAddComponent extends AbstractColor implements OnInit, OnDestroy {
    color: Color;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.color = new Color();
        this.colorFormGroup = this.formBuilder.formGroup(this.color) as IFormGroup<Color>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
