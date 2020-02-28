import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './material.routing'

import { MaterialListComponent } from './list/material-list.component'
import { MaterialEditComponent } from './edit/material-edit.component';
import { MaterialAddComponent } from './add/material-add.component';
import { MaterialSharedModule } from './material-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,MaterialSharedModule,
        ROUTING
    ],
    declarations: [MaterialListComponent,MaterialEditComponent,MaterialAddComponent],
    exports: [RouterModule],
    providers: []
})
export class MaterialModule { }


