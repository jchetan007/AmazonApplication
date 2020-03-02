import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './seller.routing'

import { SellerListComponent } from './list/seller-list.component'
import { SellerEditComponent } from './edit/seller-edit.component';
import { SellerAddComponent } from './add/seller-add.component';
import { SellerSharedModule } from './seller-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,SellerSharedModule,
        ROUTING
    ],
    declarations: [SellerListComponent,SellerEditComponent,SellerAddComponent],
    exports: [RouterModule],
    providers: []
})
export class SellerModule { }


