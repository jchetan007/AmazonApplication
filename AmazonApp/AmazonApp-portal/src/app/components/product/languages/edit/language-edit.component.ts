import { Component, OnInit, OnDestroy } from "@angular/core"
import { AbstractLanguage } from '../domain/abstract-language';

import { Subscription } from 'rxjs';
import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';
import { ActivatedRoute } from '@angular/router';

import { Language } from '@app/models';

@Component({
    selector: "app-language-edit",
    templateUrl: './language-edit.component.html'
})
export class LanguageEditComponent extends AbstractLanguage implements OnInit, OnDestroy {
    language: Language;
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
            this.languageFormGroup = this.formBuilder.formGroup(Language,t) as IFormGroup<Language>;
        })
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
