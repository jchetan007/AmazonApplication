import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './v-promo-code.routing'

import { vPromoCodeListComponent } from './list/v-promo-code-list.component'
import { vPromoCodeEditComponent } from './edit/v-promo-code-edit.component';
import { vPromoCodeAddComponent } from './add/v-promo-code-add.component';
import { vPromoCodeSharedModule } from './v-promo-code-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,vPromoCodeSharedModule,
        ROUTING
    ],
    declarations: [vPromoCodeListComponent,vPromoCodeEditComponent,vPromoCodeAddComponent],
    exports: [RouterModule],
    providers: []
})
export class vPromoCodeModule { }


