import { Component, OnInit, OnDestroy } from "@angular/core"
import { List } from "@rxweb/generics"
import { AbstractLanguage } from '../domain/abstract-language';
import { Language } from "@app/models";
import { Subscription } from 'rxjs';

@Component({
    selector:"app-language-list",
    templateUrl:'./language-list.component.html'
})
export class LanguageListComponent extends AbstractLanguage implements OnInit, OnDestroy {
    languages: List<Language>;
    subscription: Subscription;

    ngOnInit(): void {
        this.subscription = this.get().subscribe((t: List<Language>) => {
            this.languages = t;
        })
    }


    ngOnDestroy(): void {
        if (this.subscription)
            this.subscription.unsubscribe();
    }

}
