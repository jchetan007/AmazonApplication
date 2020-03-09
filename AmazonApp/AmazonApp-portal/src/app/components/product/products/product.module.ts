import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './product.routing'

import { ProductListComponent } from './list/product-list.component'
import { ProductEditComponent } from './edit/product-edit.component';
import { ProductAddComponent } from './add/product-add.component';
import { ProductSharedModule } from './product-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,ProductSharedModule,
        ROUTING
    ],
    declarations: [ProductListComponent,ProductEditComponent,ProductAddComponent],
    exports: [RouterModule],
    providers: []
})
export class ProductModule { }


