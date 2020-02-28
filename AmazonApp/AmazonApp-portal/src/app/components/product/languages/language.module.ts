import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './language.routing'

import { LanguageListComponent } from './list/language-list.component'
import { LanguageEditComponent } from './edit/language-edit.component';
import { LanguageAddComponent } from './add/language-add.component';
import { LanguageSharedModule } from './language-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,LanguageSharedModule,
        ROUTING
    ],
    declarations: [LanguageListComponent,LanguageEditComponent,LanguageAddComponent],
    exports: [RouterModule],
    providers: []
})
export class LanguageModule { }


