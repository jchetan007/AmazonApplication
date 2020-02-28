import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './brand.routing'

import { BrandListComponent } from './list/brand-list.component'
import { BrandEditComponent } from './edit/brand-edit.component';
import { BrandAddComponent } from './add/brand-add.component';
import { BrandSharedModule } from './brand-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,BrandSharedModule,
        ROUTING
    ],
    declarations: [BrandListComponent,BrandEditComponent,BrandAddComponent],
    exports: [RouterModule],
    providers: []
})
export class BrandModule { }


