import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './verify-login.routing'

import { VerifyLoginListComponent } from './list/verify-login-list.component'
import { VerifyLoginEditComponent } from './edit/verify-login-edit.component';
import { VerifyLoginAddComponent } from './add/verify-login-add.component';
import { VerifyLoginSharedModule } from './verify-login-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,VerifyLoginSharedModule,
        ROUTING
    ],
    declarations: [VerifyLoginListComponent,VerifyLoginEditComponent,VerifyLoginAddComponent],
    exports: [RouterModule],
    providers: []
})
export class VerifyLoginModule { }


