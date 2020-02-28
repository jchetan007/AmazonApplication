import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './color.routing'

import { ColorListComponent } from './list/color-list.component'
import { ColorEditComponent } from './edit/color-edit.component';
import { ColorAddComponent } from './add/color-add.component';
import { ColorSharedModule } from './color-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,ColorSharedModule,
        ROUTING
    ],
    declarations: [ColorListComponent,ColorEditComponent,ColorAddComponent],
    exports: [RouterModule],
    providers: []
})
export class ColorModule { }


