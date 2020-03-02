import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from "@angular/forms";

import { RxReactiveFormsModule } from "@rxweb/reactive-form-validators";

import { ROUTING } from './order.routing'

import { OrderListComponent } from './list/order-list.component'
import { OrderEditComponent } from './edit/order-edit.component';
import { OrderAddComponent } from './add/order-add.component';
import { OrderSharedModule } from './order-shared.module';

@NgModule({
    imports: [
        CommonModule, FormsModule, ReactiveFormsModule, RxReactiveFormsModule,OrderSharedModule,
        ROUTING
    ],
    declarations: [OrderListComponent,OrderEditComponent,OrderAddComponent],
    exports: [RouterModule],
    providers: []
})
export class OrderModule { }


