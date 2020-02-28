import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Size } from '@app/models';
import { AbstractSize } from '../domain/abstract-size';

@Component({
    selector: "app-size-add",
    templateUrl: './size-add.component.html'
})
export class SizeAddComponent extends AbstractSize implements OnInit, OnDestroy {
    size: Size;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.size = new Size();
        this.sizeFormGroup = this.formBuilder.formGroup(this.size) as IFormGroup<Size>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
