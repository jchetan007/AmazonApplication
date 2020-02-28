import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './promo-code.routing'

import { PromoCodeListComponent } from './list/promo-code-list.component'
import { PromoCodeEditComponent } from './edit/promo-code-edit.component';
import { PromoCodeAddComponent } from './add/promo-code-add.component';
import { PromoCodeSharedModule } from './promo-code-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,PromoCodeSharedModule,
        ROUTING
    ],
    declarations: [PromoCodeListComponent,PromoCodeEditComponent,PromoCodeAddComponent],
    exports: [RouterModule],
    providers: []
})
export class PromoCodeModule { }


