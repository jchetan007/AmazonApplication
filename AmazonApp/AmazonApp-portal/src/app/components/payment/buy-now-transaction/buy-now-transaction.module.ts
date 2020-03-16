import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './buy-now-transaction.routing'

import { BuyNowTransactionListComponent } from './list/buy-now-transaction-list.component'
import { BuyNowTransactionEditComponent } from './edit/buy-now-transaction-edit.component';
import { BuyNowTransactionAddComponent } from './add/buy-now-transaction-add.component';
import { BuyNowTransactionSharedModule } from './buy-now-transaction-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,BuyNowTransactionSharedModule,
        ROUTING
    ],
    declarations: [BuyNowTransactionListComponent,BuyNowTransactionEditComponent,BuyNowTransactionAddComponent],
    exports: [RouterModule],
    providers: []
})
export class BuyNowTransactionModule { }


