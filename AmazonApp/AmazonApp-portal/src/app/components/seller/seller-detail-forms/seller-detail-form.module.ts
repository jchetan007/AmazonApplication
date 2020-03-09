import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './seller-detail-form.routing'

import { SellerDetailFormListComponent } from './list/seller-detail-form-list.component'
import { SellerDetailFormEditComponent } from './edit/seller-detail-form-edit.component';
import { SellerDetailFormAddComponent } from './add/seller-detail-form-add.component';
import { SellerDetailFormSharedModule } from './seller-detail-form-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,SellerDetailFormSharedModule,
        ROUTING
    ],
    declarations: [SellerDetailFormListComponent,SellerDetailFormEditComponent,SellerDetailFormAddComponent],
    exports: [RouterModule],
    providers: []
})
export class SellerDetailFormModule { }


