import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractBrand } from '../domain/abstract-brand';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Brand } from '@app/models';

@Component({
    selector: "app-brand-edit",
    templateUrl: './brand-edit.component.html'
})
export class BrandEditComponent extends AbstractBrand implements OnInit, OnDestroy {
    brand: Brand;
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
            this.brandFormGroup = this.formBuilder.formGroup(Brand,t) as IFormGroup<Brand>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
