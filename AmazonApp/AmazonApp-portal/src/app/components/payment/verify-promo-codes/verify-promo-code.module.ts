import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './verify-promo-code.routing'

import { VerifyPromoCodeListComponent } from './list/verify-promo-code-list.component'
import { VerifyPromoCodeEditComponent } from './edit/verify-promo-code-edit.component';
import { VerifyPromoCodeAddComponent } from './add/verify-promo-code-add.component';
import { VerifyPromoCodeSharedModule } from './verify-promo-code-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,VerifyPromoCodeSharedModule,
        ROUTING
    ],
    declarations: [VerifyPromoCodeListComponent,VerifyPromoCodeEditComponent,VerifyPromoCodeAddComponent],
    exports: [RouterModule],
    providers: []
})
export class VerifyPromoCodeModule { }


