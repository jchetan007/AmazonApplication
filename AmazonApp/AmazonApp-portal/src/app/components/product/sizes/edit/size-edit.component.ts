import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractSize } from '../domain/abstract-size';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Size } from '@app/models';

@Component({
    selector: "app-size-edit",
    templateUrl: './size-edit.component.html'
})
export class SizeEditComponent extends AbstractSize implements OnInit, OnDestroy {
    size: Size;
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
            this.sizeFormGroup = this.formBuilder.formGroup(Size,t) as IFormGroup<Size>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
