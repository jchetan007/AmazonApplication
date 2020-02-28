import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './v-cart-item.routing'

import { vCartItemListComponent } from './list/v-cart-item-list.component'
import { vCartItemEditComponent } from './edit/v-cart-item-edit.component';
import { vCartItemAddComponent } from './add/v-cart-item-add.component';
import { vCartItemSharedModule } from './v-cart-item-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,vCartItemSharedModule,
        ROUTING
    ],
    declarations: [vCartItemListComponent,vCartItemEditComponent,vCartItemAddComponent],
    exports: [RouterModule],
    providers: []
})
export class vCartItemModule { }


