import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './cart-item.routing'

import { CartItemListComponent } from './list/cart-item-list.component'
import { CartItemEditComponent } from './edit/cart-item-edit.component';
import { CartItemAddComponent } from './add/cart-item-add.component';
import { CartItemSharedModule } from './cart-item-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,CartItemSharedModule,
        ROUTING
    ],
    declarations: [CartItemListComponent,CartItemEditComponent,CartItemAddComponent],
    exports: [RouterModule],
    providers: []
})
export class CartItemModule { }


