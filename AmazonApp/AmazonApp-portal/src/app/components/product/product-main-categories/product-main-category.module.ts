import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './product-main-category.routing'

import { ProductMainCategoryListComponent } from './list/product-main-category-list.component'
import { ProductMainCategoryEditComponent } from './edit/product-main-category-edit.component';
import { ProductMainCategoryAddComponent } from './add/product-main-category-add.component';
import { ProductMainCategorySharedModule } from './product-main-category-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,ProductMainCategorySharedModule,
        ROUTING
    ],
    declarations: [ProductMainCategoryListComponent,ProductMainCategoryEditComponent,ProductMainCategoryAddComponent],
    exports: [RouterModule],
    providers: []
})
export class ProductMainCategoryModule { }


