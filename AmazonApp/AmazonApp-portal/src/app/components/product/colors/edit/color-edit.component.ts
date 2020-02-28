import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractColor } from '../domain/abstract-color';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Color } from '@app/models';

@Component({
    selector: "app-color-edit",
    templateUrl: './color-edit.component.html'
})
export class ColorEditComponent extends AbstractColor implements OnInit, OnDestroy {
    color: Color;
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
            this.colorFormGroup = this.formBuilder.formGroup(Color,t) as IFormGroup<Color>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
