import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './verify-otp.routing'

import { VerifyOtpListComponent } from './list/verify-otp-list.component'
import { VerifyOtpEditComponent } from './edit/verify-otp-edit.component';
import { VerifyOtpAddComponent } from './add/verify-otp-add.component';
import { VerifyOtpSharedModule } from './verify-otp-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,VerifyOtpSharedModule,
        ROUTING
    ],
    declarations: [VerifyOtpListComponent,VerifyOtpEditComponent,VerifyOtpAddComponent],
    exports: [RouterModule],
    providers: []
})
export class VerifyOtpModule { }


