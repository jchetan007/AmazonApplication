import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Brand } from '@app/models';
import { AbstractBrand } from '../domain/abstract-brand';

@Component({
    selector: "app-brand-add",
    templateUrl: './brand-add.component.html'
})
export class BrandAddComponent extends AbstractBrand implements OnInit, OnDestroy {
    brand: Brand;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.brand = new Brand();
        this.brandFormGroup = this.formBuilder.formGroup(this.brand) as IFormGroup<Brand>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
