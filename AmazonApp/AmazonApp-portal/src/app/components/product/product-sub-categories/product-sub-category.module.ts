import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './product-sub-category.routing'

import { ProductSubCategoryListComponent } from './list/product-sub-category-list.component'
import { ProductSubCategoryEditComponent } from './edit/product-sub-category-edit.component';
import { ProductSubCategoryAddComponent } from './add/product-sub-category-add.component';
import { ProductSubCategorySharedModule } from './product-sub-category-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,ProductSubCategorySharedModule,
        ROUTING
    ],
    declarations: [ProductSubCategoryListComponent,ProductSubCategoryEditComponent,ProductSubCategoryAddComponent],
    exports: [RouterModule],
    providers: []
})
export class ProductSubCategoryModule { }


