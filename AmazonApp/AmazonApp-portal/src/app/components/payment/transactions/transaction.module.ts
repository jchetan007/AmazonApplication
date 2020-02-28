import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './transaction.routing'

import { TransactionListComponent } from './list/transaction-list.component'
import { TransactionEditComponent } from './edit/transaction-edit.component';
import { TransactionAddComponent } from './add/transaction-add.component';
import { TransactionSharedModule } from './transaction-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,TransactionSharedModule,
        ROUTING
    ],
    declarations: [TransactionListComponent,TransactionEditComponent,TransactionAddComponent],
    exports: [RouterModule],
    providers: []
})
export class TransactionModule { }


