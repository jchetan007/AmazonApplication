import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './v-product.routing'

import { vProductListComponent } from './list/v-product-list.component'
import { vProductEditComponent } from './edit/v-product-edit.component';
import { vProductAddComponent } from './add/v-product-add.component';
import { vProductSharedModule } from './v-product-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,vProductSharedModule,
        ROUTING
    ],
    declarations: [vProductListComponent,vProductEditComponent,vProductAddComponent],
    exports: [RouterModule],
    providers: []
})
export class vProductModule { }


