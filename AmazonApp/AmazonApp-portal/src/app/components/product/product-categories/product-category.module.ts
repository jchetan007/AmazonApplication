import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './product-category.routing'

import { ProductCategoryListComponent } from './list/product-category-list.component'
import { ProductCategoryEditComponent } from './edit/product-category-edit.component';
import { ProductCategoryAddComponent } from './add/product-category-add.component';
import { ProductCategorySharedModule } from './product-category-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,ProductCategorySharedModule,
        ROUTING
    ],
    declarations: [ProductCategoryListComponent,ProductCategoryEditComponent,ProductCategoryAddComponent],
    exports: [RouterModule],
    providers: []
})
export class ProductCategoryModule { }


