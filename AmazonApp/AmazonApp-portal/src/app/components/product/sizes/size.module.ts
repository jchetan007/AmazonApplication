import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './size.routing'

import { SizeListComponent } from './list/size-list.component'
import { SizeEditComponent } from './edit/size-edit.component';
import { SizeAddComponent } from './add/size-add.component';
import { SizeSharedModule } from './size-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,SizeSharedModule,
        ROUTING
    ],
    declarations: [SizeListComponent,SizeEditComponent,SizeAddComponent],
    exports: [RouterModule],
    providers: []
})
export class SizeModule { }


