import { Component, OnInit, OnDestroy } from "@angular/core"
import { Subscription } from 'rxjs';

import { RxFormBuilder, IFormGroup } from '@rxweb/reactive-form-validators';

import { Language } from '@app/models';
import { AbstractLanguage } from '../domain/abstract-language';

@Component({
    selector: "app-language-add",
    templateUrl: './language-add.component.html'
})
export class LanguageAddComponent extends AbstractLanguage implements OnInit, OnDestroy {
    language: Language;
    subscription: Subscription;

    constructor(private formBuilder: RxFormBuilder) {
        super();
    }

    ngOnInit(): void {
        this.language = new Language();
        this.languageFormGroup = this.formBuilder.formGroup(this.language) as IFormGroup<Language>;
    }

    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
