import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './discount.routing'

import { DiscountListComponent } from './list/discount-list.component'
import { DiscountEditComponent } from './edit/discount-edit.component';
import { DiscountAddComponent } from './add/discount-add.component';
import { DiscountSharedModule } from './discount-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,DiscountSharedModule,
        ROUTING
    ],
    declarations: [DiscountListComponent,DiscountEditComponent,DiscountAddComponent],
    exports: [RouterModule],
    providers: []
})
export class DiscountModule { }


